module Gallery
  class Gallery
    include ActiveModel::Model

    attr_accessor :id, :show_gallery_titles, :gallery_link
    attr_reader :statement
    attr_writer :name, :images, :gallery_slugs

    cattr_accessor :all

    alias slug id

    def initialize(attrs = {})
      super
      self.images = images.each_with_index.map do |image, index|
        Image.new(image.merge(gallery: self, index: index))
      end
    end

    def name
      @name || slug.humanize.titleize
    end

    def images
      @images ||= []
    end

    def gallery_slugs
      @gallery_slugs ||= []
    end

    def galleries
      gallery_slugs.map { |s| self.class.find(s) }
    end

    def galleries=(galleries)
      self.gallery_slugs = galleries.map do |gallery|
        gallery.is_a?(self.class) ? gallery.slug : gallery
      end
    end

    # Whether or not this gallery is just a collection of other galleries.
    def meta?
      images.empty? && !galleries.empty?
    end

    def statement=(statement)
      @statement = case statement
                   when Statement then statement
                   when String then Statement.new(title: name, text: statement, gallery: self)
                   when Hash then Statement.new(title: statement['title'], text: statement['text'], gallery: self)
                   end
    end

    def statement?
      statement.present?
    end

    def show_gallery_titles?
      show_gallery_titles.present?
    end

    def path(params = {})
      gallery = gallery_link || slug
      Rails.application.routes.url_helpers.gallery_path(gallery, params)
    end

    def statement_path(params = {})
      Rails.application.routes.url_helpers.gallery_statement_path(slug, params) if statement?
    end

    def end_path(params = {})
      statement? ? statement_path(params) : path(params)
    end

    def self.find(name)
      all.find { |g| g.slug == name } || raise(NotFound)
    end
  end
end
