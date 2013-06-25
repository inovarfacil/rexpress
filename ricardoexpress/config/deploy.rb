# RVM bootstrap
#$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
#$:.unshift(File.expand_path('/usr/local/rvm/lib', ENV['rvm_path']))
#require 'rvm/capistrano'
#set :rvm_ruby_string, 'ree'
#set :rvm_ruby_string, 'ree@rexpress'

# bundler bootstrap
require 'bundler/capistrano'

# main details
set :application, "rexpress.com.br"
role :web, "rexpress.com.br"
role :app, "rexpress.com.br"
role :db,  "rexpress.com.br", :primary => true

# server details
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :deploy_to, "/home/ricardoexpress/public_html/rexpress.com.br"
set :deploy_via, :remote_cache
set :user, "root"
set :use_sudo, false

set :bundle_without, [:development]

# repository details
set :repository,  "."
set :scm, :none
set :deploy_via, :copy

set :checkout, 'export'

set :chmod755, "app config db lib public vendor script script/* public/disp*"

# tasks
namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

##########################################################################################################
#set :application, "set your application name here"
#set :repository,  "set your repository location here"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
##########################################################################################################