class GalleriesController < ApplicationController
  LOUPE_COOKIE_NAME = :gallery_loupe_notice_seen

  before_action :find_gallery, except: :dismiss_loupe_notice
  before_action :find_template, only: :index
  before_action :find_image, :set_loupe_notice, only: :show

  def index
    render @template
  end

  def show
  end

  def statement
  end

  def dismiss_loupe_notice
    cookies.permanent.signed[LOUPE_COOKIE_NAME] = true
    head :no_content
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

  def set_loupe_notice
    @show_loupe_notice = cookies.signed[LOUPE_COOKIE_NAME].blank?
  end
end
