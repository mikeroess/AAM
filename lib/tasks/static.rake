namespace :static do
  build_dir = Rails.root.join('_static')

  desc 'Clean the static version of the site'
  task :clean do
    FileUtils.remove_dir(build_dir, force: true)
  end

  desc 'Build a static version of the site'
  task build: %i[assets:precompile clean] do
    Parklife.application.tap do |app|
      app.load_Parkfile(File.join(Dir.pwd, 'Parkfile'))
    end.build
    Rails.root.join('public').each_child do |dir|
      FileUtils.cp_r(dir, build_dir)
    end
  end

  desc 'Serve the static site'
  task serve: :build do
    require 'webrick'
    WEBrick::HTTPServer.new(Port: 8000, DocumentRoot: build_dir).start
  end

  desc 'Deploy a copy of the static site'
  task deploy: :build do
    puts '== Uploading static site to server'
    system  'rsync',
            '--archive', '--recursive', '--rsh=ssh', '--progress', '--delete',
            '--one-file-system', '--compress',
            '--exclude=czechslovakphotos.com',
            "#{build_dir}/",
            'annearde@anneardenmcdonald.com:~/public_html/'
    puts '== Done syncing static site'
  end
end
