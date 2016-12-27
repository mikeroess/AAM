class GalleriesController < ApplicationController
  before_action :find_gallery
  before_action :find_template, only: :index
  before_action :find_image, only: :show

  rescue_from Gallery::NotFound, with: :not_found

  def index
    render @template
  end

  def show
  end

  def statement
  end

  private

  def find_gallery
    @gallery = Gallery::Gallery.find(params[:gallery])
  end

  def find_template
    @template = if template_exists?("galleries/#{@gallery.slug}")
                  "galleries/#{@gallery.slug}"
                else
                  'galleries/index'
                end
  end

  def find_image
    @image = @gallery.images[params[:id].to_i - 1]
  end
end
