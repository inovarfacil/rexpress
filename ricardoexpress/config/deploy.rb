set :user, "ricardoexpress" #to change
set :host, "198.199.104.205" #to change
set :domain, "rexpress.com.br" #to change
set :application, "ricardoexpress" #to change
set :deploy_to, "/home/#{user}/public/" #to change

set :repository, "git://github.com/inovarfacil/rexpress.git" #to change
set :branch,     "origin/master"

# =============================================================================

role :web, host
role :app, host
role :db,  host

set :scm, :git

set :current_release, 

ssh_options[:username] = user
ssh_options[:paranoid] = false

# =============================================================================

desc "send config files to server"
task :before_setup do
  run "test -d #{deploy_to}/etc || mkdir -m 755 #{deploy_to}/etc"
  upload File.join(File.dirname(__FILE__), "templates/database.yml"), "#{deploy_to}/etc/database.yml"
end

namespace :deploy do
  desc "Restart with Passenger"
  task :restart, :roles => :app do
    run "touch #{deploy_to}/tmp/restart.txt"
  end
 
  desc "Setup a GitHub-style deployment."
  task :setup, :except => { :no_release => true } do
    run "git clone #{repository} #{current_path}"
    run "test -d #{current_path}/tmp || mkdir -m 755 #{current_path}/tmp"
    run "test -d #{current_path}/db || mkdir -m 755 #{current_path}/db"
  end
 
  desc "Update the deployed code."
  task :update_code, :except => { :no_release => true } do
    run "cd #{current_path}; git fetch origin; git reset --hard #{branch}"
  end
 
  desc "check if the configurations files are present"
  task :symlink do
    on_rollback {}
    run <<-CMD
      rm -rf #{current_path}/log #{current_path}/public/system #{current_path}/tmp/pids #{current_path}/config/database.yml &&
      ln -s #{shared_path}/log #{current_path}/log &&
      ln -s #{shared_path}/system #{current_path}/public/system &&
      ln -s #{shared_path}/pids #{current_path}/tmp/pids &&
      ln -s #{deploy_to}/etc/database.yml #{current_path}/config/database.yml &&
      cd #{current_path} && rake db:migrate RAILS_ENV=production
    CMD
  end

  namespace :rollback do
    task :default do
      revision
      restart
    end
    
    desc "Rollback a single commit."
    task :revision, :except => { :no_release => true } do
      set :branch, "HEAD^"
      default
    end
  end

end