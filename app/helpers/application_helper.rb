module ApplicationHelper
  def stripped_uri
    path = URI(request.original_url).path.split('/').last
    path.blank? ? nil : "/#{path.gsub(/\d/, '')}"
  end

  def method_missing(method, *args, &_blk)
    return super unless method.to_s.end_with?('_page?')
    prefixes = send(:"#{method.to_s.gsub('_page?', '')}_path_prefixes")
    prefixes.include? stripped_uri
  end

  def respond_to_missing?(method, include_private=false)
    method.to_s.end_with?('_page?') || super
  end

  private

  def new_work_path_prefixes
    [new_work_path, '/ap', atom_planet_statement_path, '/bodies', bodies_statement_path]
  end

  def self_portrait_path_prefixes
    [self_portrait_path, self_portrait_statement_path, '/sp']
  end

  def plastic_camera_path_prefixes
    [
      icon_diana_path, icon_diana_statement_path,
      garden_diana_path, garden_diana_statement_path,
      pillow_book_path, pillow_book_statement_path,
      plastic_camera_path
    ]
  end

  def watches_path_prefixes
    [watches_path, watches_statement_path]
  end

  def archive_path_prefixes
    [
      archive_path, milan_path, milan_statement_path,
      layered_path, layered_statement_path,
      group_path, group_statement_path,
      botanicals_path, botanicals_statement_path,
      bouyancy_path, bouyancy_statement_path,
      botanical_book_path, botanical_book_statement_path,
      monoprints_path, monoprints_statement_path,
      hands_path, hands_statement_path,
      dresses_path, dresses_statement_path,
      murals_path, murals_statement_path,
      bubbles_path, circles_statement_path
    ]
  end

  def about_path_prefixes
    [about_path, resume_path, biography_path, aauaudio_path, bofvideo_path, criticism_path]
  end

  def contact_path_prefixes
    [contact_path]
  end
end
