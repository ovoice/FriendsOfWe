set :keep_releases,       5
set :application,         "FriendsOfWe"
set :user,                "root"
set :use_sudo,            false

set :deploy_to,           "/var/rails/#{application}"
set :scm,                 :git
set :repository,          "git@github.com:ovoice/FriendsOfWe.git"
set :deploy_via,          :remote_cache
set :real_revision,       lambda { source.query_revision(revision) { |cmd| capture(cmd) } } # This will execute the Git revision parsing on the *remote* server rather than locally

set :dbuser,              "root"

ssh_options[:paranoid] = false # comment out if it gives you trouble. newest net/ssh needs this set.

task :production do
  set :branch,              "master"
  set :production_database, "friendsofwe_production"
  set :production_dbhost,   "localhost"
  set :dbpass,              "UPDATE WITH PASSWORD"
  set :rails_env,           "production"
  role :web, "208.88.124.160"
  role :app, "208.88.124.160"
  role :db , "208.88.124.160", :primary => true
end

after "deploy", "deploy:cleanup"
after "deploy:migrations" , "deploy:cleanup"
after "deploy:update_code", "deploy:symlinks"
after "deploy:restart", "deploy:set_premissions" #see set_premissions note below


# uncomment the following to have a database backup done before every migration
# before "deploy:migrate", "db:dump"

namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end
  
  desc "Restart the passenger module to reload the application after deploying."
  task :restart, :roles => :app do
    run  "touch #{current_path}/tmp/restart.txt"
  end
  
  task :symlinks do
    run "cd #{release_path}; ln -nsf #{shared_path}/log #{release_path}/log" 
    run "cd #{release_path}; ln -nsf #{shared_path}/attachments #{release_path}/public/attachments"
    run "cd #{release_path}; ln -nsf #{shared_path}/database.yml #{release_path}/config/database.yml" 
    run "cd #{release_path}; ln -nsf #{shared_path}/production.rb #{release_path}/config/environments/production.rb" 
    run "cd #{release_path}; ln -nsf #{shared_path}/robots.txt #{release_path}/public/robots.txt"
  end
  
  task :set_premissions do
    run "cd #{release_path}; chown -R www-data * "
  end
  
end