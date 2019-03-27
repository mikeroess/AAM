require 'pdf/reader'
require 'pp'

namespace :resume do
  desc 'Parse Anne\'s PDF resume and convert it to HTML'
  task parse: :environment do
    reader = PDF::Reader.new(Rails.root + 'public' + 'media' + 'resume.pdf')
    parser = ResumeParser.new(reader)
    File.open(Rails.root + 'app' + 'views' + 'pages' + 'resume.html.erb', 'w') do |f|
      f << parser.as_html
    end
  end
end

class ResumeParser
  attr_accessor :reader

  def initialize(reader)
    self.reader = reader
  end

  def as_html
    [].tap do |lines|
      lines << '<div id="resume" class="container-constrained resume">'
      lines << '  <div class="row">'
      lines << '    <div class="col-xs-12">'
      lines.concat sections.map(&:render).flatten.map { |l| "      #{l}" }
      lines << '    </div>'
      lines << '  </div>'
      lines << '</div>'
    end.join("\n")
  end

  def sections
    collector = Collector.new
    reader.pages.each { |p| p.walk(collector) }

    sections = []

    collector.lines.each do |line|
      next if line.strip.empty?

      normalized = line
                   .gsub(/\s+,/, ',')
                   .gsub(/\-\s+/, '-')
                   .gsub(%r{</em>(\s*)<em>}, '\1')
                   .gsub(%r{<em>\s+</em>}, ' ')
                   .gsub(%r{(\s+)</em>}, '</em>\1')
                   .gsub(',</em>', '</em>,')
                   .gsub(/<em>\s+/, '<em>')

      case
      when section_header?(line) then sections << [normalized]
      when !sections.empty? then sections[-1] << normalized
      end
    end

    sections.map { |section| Section.parse(section) }
  end

  class Collector
    attr_writer :page
    attr_reader :lines

    def initialize
      @font = nil
      @format = nil
      @newline = true
      @current_y = nil
      @lines = []
    end

    def concatenate_matrix(_, _, _, _, _, y)
      if @current_y == y
        @newline = false
      else
        @current_y = y
        @newline = true
      end
    end

    def set_text_font_and_size(font, size)
      font_h = @page.fonts[font]
      @font = PDF::Reader::Font.new(@page.objects, font_h)
      @format = case
                when font_h[:FontDescriptor][:ItalicAngle] != 0 then :em
                else nil
                end
    end

    def show_text_with_positioning(parts)
      show_text(parts.select { |p| p.is_a?(String) }.join)
    end

    def show_text(text)
      formatted_text = case @format
                       when :em then "<em>#{text}</em>"
                       when :strong then "<strong>#{text}</strong>"
                       else text
                       end
      formatted_text = @font.to_utf8(formatted_text)
      if @newline
        @lines << formatted_text
        @newline = false
      else
        @lines << '' if @lines.empty?
        @lines[-1] << formatted_text
      end
    end
  end

  class Section
    attr_accessor :items
    attr_writer :title

    def title
      @title.titlecase
    end

    def render
      [].tap do |lines|
        lines << '<section>'
        lines << "  <h5>#{title}</h5>"
        lines.concat render_items
        lines << '</section>'
      end
    end

    def render_items
      []
    end

    def self.parse(lines)
      case
      when lines[1].strip =~ /^[0-9]/
        YearSection.parse(lines)
      else
        ColumnsSection.parse(lines)
      end
    end
  end

  class YearSection < Section
    def render_items
      [].tap do |lines|
        lines << '  <dl>'
        items.each do |group|
          lines << "    <dt>#{group[:year]}</dt>"
          lines << '    <dd>'
          lines << '      <ul>'
          lines.concat group[:lines].map { |i| "        <li>#{i}</li>" }
          lines << '      </ul>'
          lines << '    </dd>'
        end
        lines << '  </dl>'
      end
    end

    def self.parse(lines)
      new.tap do |section|
        section.title = lines.shift.strip

        parsed = []
        lines.each do |line|
          if line.strip =~ /^[0-9]/
            year, line = /^([\d-]+)(.*)/.match(line.strip).captures
            parsed << { year: year.strip, lines: [line.strip] }
          else
            parsed[-1][:lines] << line.strip
          end
        end
        section.items = parsed
      end
    end
  end

  class ColumnsSection < Section
    def render_items
      [].tap do |lines|
        items.partition.with_index { |_, i| i.even? }.each do |group|
          lines << '  <div class="col-xs-12 col-sm-6 col-md-4">'
          lines.concat group.map { |i| "    #{i}<br />" }
          lines << '  </div>'
        end
        lines << '  <div class="hidden-xs hidden-sm col-md-4"></div>'
      end
    end

    def self.parse(lines)
      new.tap do |section|
        section.title = lines.shift.strip

        section.items = []
        lines.each do |line|
          line.strip.split(/\s{2,}/).each do |part|
            section.items << part
          end
        end
      end
    end
  end

  private

  def section_header?(line)
    !line.start_with?(' ') && line.upcase == line
  end
end
