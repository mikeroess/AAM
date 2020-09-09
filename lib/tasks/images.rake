namespace :images do
  desc 'Compress/optimize image assets'
  task optimize: :environment do
    Rails.root.join('app', 'assets', 'images').find do |file|
      escaped = Shellwords.escape(file)

      case file.extname.downcase.sub('.', '').to_sym
      when :jpg, :jpeg
        system "jpegoptim -sp #{escaped}"
      when :png
        system "optipng #{escaped}"
      when :gif
        system "gifsicle --output=#{escaped} --no-comments --no-names --same-delay --same-loopcount -- #{escaped}"
      else
        p "No optimizer found for #{file}"
      end
    end
  end
end
