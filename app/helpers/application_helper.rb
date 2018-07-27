module ApplicationHelper
  PAGE_GROUPS = [
    :front, :gallery_image, :gallery, :about, :contact
  ].freeze

  Gallery::Gallery.all.each do |gallery|
    define_method(:"#{gallery.slug}_page?") do
      current_path_starts_with?(gallery.path)
    end
  end

  def stripped_uri
    path = URI(request.original_url).path
    path.blank? ? nil : path.gsub(%r{/\d+}, '')
  end

  def current_page_class
    group = PAGE_GROUPS.find { |g| send(:"#{g}_page?") }
    group ? "#{group.to_s.tr('_', '-')}-page" : ''
  end

  def front_page?
    URI(request.original_url).path == '/'
  end

  def gallery_page?
    Gallery::Gallery.all.any? { |g| send(:"#{g.slug}_page?") }
  end

  def gallery_image_page?
    gallery_page? && request.params[:id].present?
  end

  def framed_page?
    current_path_starts_with?(gallery_path(:framed))
  end

  def scrolls_page?
    current_path_starts_with?(
      gallery_path(:scrolls), gallery_path(:atom_planet), gallery_path(:bodies)
    )
  end

  def plastic_camera_page?
    current_path_starts_with?(
      gallery_path(:icon_diana),
      gallery_path(:garden_diana),
      gallery_path(:pillow_book),
      gallery_path(:plastic_camera)
    )
  end

  def archive_page?
    plastic_camera_page? || current_path_starts_with?(
      gallery_path(:archive),
      gallery_path(:milan),
      gallery_path(:layered),
      gallery_path(:group),
      gallery_path(:botanicals),
      gallery_path(:watches)
    )
  end

  def about_page?
    current_path_starts_with?(
      about_path, resume_path, aauaudio_path, bofvideo_path, criticisms_path
    )
  end

  def contact_page?
    current_path_starts_with?(contact_path)
  end

  def loop_clearfix(index)
    classes = ['visible-xs', 'clearfix']
    classes << 'visible-sm' if index.odd?
    classes += ['visible-md', 'visible-lg'] if index % 3 == 2
    content_tag(:div, '', class: classes)
  end

  private

  def current_path_starts_with?(*prefixes)
    prefixes.include? stripped_uri
  end
end
