module GalleriesHelper
  def anneify(text)
    text = text
           .gsub('--', '&mdash;')
           .gsub('...', '&ellip;')

    text.split("\n").map do |paragraph|
      if paragraph.start_with?('<') && paragraph.end_with?('>')
        paragraph
      else
        content_tag(:p, paragraph, nil, false)
      end
    end.join
  end

  def image_details(image)
    details = image.long_text
    details << ' (not available)' if image.sold?
    details << " &mdash; #{link_to('Statement', image.gallery.statement_path)}" if image.gallery.statement?
    details.html_safe
  end
end
