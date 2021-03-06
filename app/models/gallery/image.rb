module Gallery
  class Image
    include ActiveModel::Model

    attr_writer :image
    attr_accessor :name, :description, :dimensions, :year, :location,
                  :index, :gallery, :sold

    def id
      index + 1
    end

    def image
      @image || "#{name.parameterize(preserve_case: true)}.jpg"
    end

    def thumbnail
      "thumbs/#{image}"
    end

    alias sold? sold

    def short_text
      [name, location, year, dimensions].compact.join(', ')
    end

    def long_text
      [
        name, location, description, year, dimensions
      ].compact.join(', ')
    end

    def path(params = {})
      Rails.application.routes.url_helpers.gallery_image_path(gallery.slug, id, params)
    end

    def previous_path(params = {})
      if self == gallery.images.first
        gallery.end_path(params)
      else
        Rails.application.routes.url_helpers.gallery_image_path(gallery.slug, index, params)
      end
    end

    def next_path(params = {})
      if self == gallery.images.last
        gallery.end_path(params)
      else
        Rails.application.routes.url_helpers.gallery_image_path(gallery.slug, id + 1, params)
      end
    end
  end
end
