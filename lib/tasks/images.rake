desc 'Run all image tasks'
task images: ['images:optimize', 'images:thumbnails']

namespace :images do
  desc 'Generate thumbnail versions of all gallery images'
  task thumbnails: :environment do
    require 'mini_magick'

    images_dir = Rails.root.join('app', 'assets', 'images')
    thumbs_dir = images_dir.join('thumbs')

    thumbs_dir.mkpath

    Gallery::Gallery.all.each do |gallery|
      gallery.images.each do |image|
        image_path = images_dir.join(image.image)
        thumb_path = thumbs_dir.join(image.image)

        print "Generating thumbnail for #{image.image}..."

        tempfile = Tempfile.new(['', image_path.extname])
        image = MiniMagick::Image.open(image_path)
        image.resize '600>'
        image.write(tempfile.path)

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

  desc 'Optimize images'
  task optimize: :environment do
    require 'image_optim'
    images = Dir["#{Rails.root.join('app', 'assets', 'images')}/*.*"]
    ImageOptim.new(
      pngcrush: false,
      pngout: false,
      advpng: false,
      pngquant: false,
      oxipng: false,
      jhead: false,
      gifsicle: false,
      svgo: false,
      jpegoptim: { allow_lossy: true, max_quality: 80 },
      verbose: true
    ).optimize_images!(images)
  end
end
