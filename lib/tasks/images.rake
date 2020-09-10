namespace :images do
  task thumbnails: :environment do
    images_dir = Rails.root.join('app', 'assets', 'images')
    thumbs_dir = images_dir.join('thumbs')

    thumbs_dir.mkpath

    Gallery::Gallery.all.each do |gallery|
      gallery.images.each do |image|
        image_path = images_dir.join(image.image)
        thumb_path = thumbs_dir.join(image.image)

        puts "Generating thumbnail for #{image.image}"
        system "magick convert #{Shellwords.escape(image_path)} -resize '600>' #{Shellwords.escape(thumb_path)}"
      end
    end
  end
end
