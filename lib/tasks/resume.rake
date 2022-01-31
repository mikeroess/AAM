require 'pdf/reader'

namespace :resume do
  desc 'Parse Anne\'s PDF resume and convert it to HTML'
  task parse: :environment do
    reader = PDF::Reader.new(Rails.root.join('public', 'media', 'resume.pdf'))
    parser = ResumeParser.new(reader)
    File.open(Rails.root.join('app', 'views', 'pages', 'resume.html.erb'), 'w') do |f|
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
      lines.concat(sections.map(&:render).flatten.map { |l| "      #{l}" })
      lines << '    </div>'
      lines << '  </div>'
      lines << '</div>'
    end.join("\n")
  end

  def sections
    collector = Collector.new
    reader.pages.each { |p| p.walk(collector) }
    group_lines_into_sections(collector.lines)
      .map { |section| Section.parse(section) }
  end

  def group_lines_into_sections(lines)
    lines.each_with_object([]) do |line, acc|
      next if line.strip.empty?

      normalized = normalize_line(line)

      if section_header?(line)
        acc << [normalized]
      elsif !acc.empty?
        acc[-1] << normalized
      end
    end
  end

  def normalize_line(line)
    line.gsub(/\s+,/, ',')
        .gsub(/-\s+/, '-')
        .gsub(%r{</em>(\s*)<em>}, '\1')
        .gsub(%r{<em>\s+</em>}, ' ')
        .gsub(%r{(\s+)</em>}, '</em>\1')
        .gsub(',</em>', '</em>,')
        .gsub(/<em>\s+/, '<em>')
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

    def set_text_matrix_and_text_line_matrix(_, _, _, _, _, y_pos) # rubocop:disable Metrics/ParameterLists
      if @current_y == y_pos
        @newline = false
      else
        @current_y = y_pos
        @newline = true
      end
    end

    def set_text_font_and_size(font, _)
      font_h = @page.fonts[font]
      @font = PDF::Reader::Font.new(@page.objects, font_h)
      @format = :em unless font_h[:FontDescriptor].nil? || font_h[:FontDescriptor][:ItalicAngle].zero?
    end

    def show_text_with_positioning(parts)
      show_text(parts.select { |p| p.is_a?(String) }.join)
    end

    def show_text(text)
      formatted_text = format_text(text)
      if @newline
        @lines << formatted_text
        @newline = false
      else
        @lines << '' if @lines.empty?
        @lines[-1] << formatted_text
      end
    end

    def format_text(text)
      formatted_text = case @format
                       when :em then "<em>#{text}</em>"
                       else text
                       end
      @font.to_utf8(formatted_text)
    end
  end

  class Section
    attr_accessor :items
    attr_writer :title

    def initialize(title = nil, items = nil)
      @title = title
      @items = items || []
    end

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
      if lines.size == 1
        Section.new(lines.first.strip)
      elsif lines[1].strip =~ /^[0-9]/
        YearSection.parse(lines)
      else
        ColumnsSection.parse(lines)
      end
    end
  end

  class YearSection < Section
    def render_items
      [].tap do |lines|
        lines.concat(items.flat_map { |group| render_group(group) })
      end
    end

    def render_group(group)
      [].tap do |lines|
        lines << '  <div class="item">'
        lines << %(    <div class="item--year">#{group[:year]}</div>)
        lines << '    <div class="item--items">'
        lines << '      <ul>'
        lines.concat(group[:lines].map { |i| "        <li>#{i}</li>" })
        lines << '      </ul>'
        lines << '    </div>'
        lines << '  </div>'
      end
    end

    def self.parse(lines)
      new(lines.shift.strip, lines.each_with_object([]) do |line, parsed|
        year, rest = /^([\d-]*)(.*)/.match(line.strip).captures
        rest = rest.strip
        if year.present?
          parsed << { year: year.strip, lines: [rest] }
        else
          parsed[-1][:lines] << rest
        end
      end)
    end
  end

  class ColumnsSection < Section
    def render_items
      [].tap do |lines|
        items.partition.with_index { |_, i| i.even? }.each do |group|
          lines << '  <div class="col-xs-12 col-sm-6 col-md-4">'
          lines.concat(group.map { |i| "    #{i}<br />" })
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
