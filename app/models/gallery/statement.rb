module Gallery
  class Statement
    include ActiveModel::Model

    attr_accessor :text, :gallery

    def path(params = {})
      Rails.application.routes.url_helpers.gallery_statement_path(gallery.slug, params)
    end
  end
end
