module Gallery
  class Image
    include ActiveModel::Model

    attr_accessor :name, :description, :dimensions, :year, :location,
                  :image, :index, :gallery

    def id
      index + 1
    end

    def short_text
      [name, location, year, dimensions].compact.join(', ')
    end

    def long_text
      [
        name, location, description, year, dimensions
      ].compact.join(', ')
    end

    def path
      Rails.application.routes.url_helpers.gallery_image_path(gallery.slug, id)
    end

    def previous_path
      if self == gallery.images.first
        gallery.end_path
      else
        Rails.application.routes.url_helpers.gallery_image_path(gallery.slug, index)
      end
    end

    def next_path
      if self == gallery.images.last
        gallery.end_path
      else
        Rails.application.routes.url_helpers.gallery_image_path(gallery.slug, id + 1)
      end
    end
  end
end
