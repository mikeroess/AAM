lock '3.3.3'

set :application, 'anneardenmcdonald.com'
set :repo_url, 'https://github.com/mikeroess/AAM.git'
set :deploy_to, '/home4/annearde/rails'
set :log_level, :info
set :linked_files, %w{config/secrets.yml}
set :linked_dirs, %w{bin log public/assets tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :keep_releases, 3

set :bundle_gemfile, -> { release_path.join('Gemfile') }
set :bundle_binstubs, -> { shared_path.join('bin') }

# Clear existing task so we can replace it rather than "add" to it.
Rake::Task["deploy:compile_assets"].clear

namespace :deploy do
  desc 'Compile assets'
  task compile_assets: [:set_rails_env] do
    invoke 'deploy:assets:precompile_local'
    invoke 'deploy:assets:backup_manifest'
  end

  namespace :assets do
    desc "Precompile assets locally and then rsync to web servers"
    task :precompile_local do
      run_locally { `RAILS_ENV=#{fetch(:stage)} bundle exec rake "assets:precompile"` }

      local_dir = './public/assets/'
      on roles(fetch(:assets_roles, [:web])) do
        remote_dir = "#{host.user}@#{host.hostname}:#{release_path}/public/assets/"
        run_locally { `rsync -av --delete #{local_dir} #{remote_dir}` }
      end

      run_locally { `rm -rf #{local_dir}` }
    end
  end
end
