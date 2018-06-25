namespace :static do
  desc 'Clean the static version of the site'
  task :clean do
    `rm -rf _static`
  end

  desc 'Build a static version of the site'
  task build: [:'assets:precompile', :clean] do
    pid_file = Rails.root.join('tmp', 'pids', 'server.pid').to_s
    if File.exist? pid_file
      server_started = false
    else
      `bundle exec rails server -d`
      server_started = true
    end

    begin
      static_dir = Rails.root.join('_static')

      ['', 'error', 'contact/success', '.htaccess'].each do |path|
        `wget --mirror -nH --no-if-modified-since --html-extension --directory-prefix="#{static_dir}" http://localhost:3000/#{path}`
      end

      Dir.glob(static_dir.join('**', '*.html').to_s).each do |file|
        base_name = file.gsub(static_dir.to_s, '')
        next if base_name == '/index.html'
        new_name = "#{static_dir}#{base_name.gsub('.html', '').gsub('.1', '')}"
        Dir.mkdir(new_name) unless Dir.exist?(new_name)
        File.rename(file, "#{new_name}/index.html")
      end
    ensure
      if server_started
        pid = File.read(pid_file)
        Process.kill(9, pid.to_i)
        File.delete(pid_file)
      end
    end
  end

  desc 'Serve the static site'
  task serve: :build do
    require 'webrick'
    WEBrick::HTTPServer.new(Port: 8000, DocumentRoot: Rails.root.join('_static')).start
  end

  desc 'Deploy a copy of the static site'
  task deploy: :build do
    puts '== Uploading static site to server'
    system  'rsync',
            '--archive', '--recursive', '--rsh=ssh', '--progress', '--delete',
            '--one-file-system', '--compress',
            '--exclude=czechslovakphotos.com',
            "#{Rails.root.join('_static')}/",
            'annearde@anneardenmcdonald.com:~/public_html/'
    puts '== Done syncing static site'
  end
end
