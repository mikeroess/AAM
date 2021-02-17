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
    parts = [image.long_text]
    parts << link_to('Statement', image.gallery.statement_path) if image.gallery.statement?
    parts.reject(&:blank?).join('&nbsp;&mdash;&nbsp;').html_safe
  end
end
