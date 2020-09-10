namespace :images do
  desc 'Generate thumbnail versions of all gallery images'
  task thumbnails: :environment do
    images_dir = Rails.root.join('app', 'assets', 'images')
    thumbs_dir = images_dir.join('thumbs')

    thumbs_dir.mkpath

    Gallery::Gallery.all.each do |gallery|
      gallery.images.each do |image|
        image_path = images_dir.join(image.image)
        thumb_path = thumbs_dir.join(image.image)

        print "Generating thumbnail for #{image.image}..."

        tempfile = Tempfile.new(['', image_path.extname])
        system "magick convert #{Shellwords.escape(image_path)} -resize '600>' #{Shellwords.escape(tempfile.path)}"

        if thumb_path.file? && FileUtils.identical?(thumb_path, tempfile.path)
          puts 'already exists, skipping'
          tempfile.delete
        else
          FileUtils.move(tempfile.path, thumb_path)
          thumb_path.chmod(0o644)
          puts 'done'
        end
      end
    end
  end
end
