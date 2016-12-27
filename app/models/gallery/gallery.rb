module Gallery
  class Gallery
    include ActiveModel::Model

    attr_accessor :id, :name, :images, :gallery_slugs, :statement
    cattr_accessor :all

    alias_method :slug, :id

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

    def statement=(text)
      @statement = if text.is_a?(Statement)
                     text
                   else
                     Statement.new(text: text, gallery: self)
                   end
    end

    def statement?
      statement.present?
    end

    def path
      Rails.application.routes.url_helpers.gallery_path(slug)
    end

    def statement_path
      Rails.application.routes.url_helpers.gallery_statement_path(slug) if statement?
    end

    def end_path
      statement? ? statement_path : path
    end

    def self.find(name)
      all.find { |g| g.slug == name } || raise(NotFound)
    end
  end
end
