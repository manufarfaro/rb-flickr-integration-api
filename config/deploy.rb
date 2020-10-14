# File kept for historical reasons, no longer used since deploy is now handled by heroku buildpack

## config valid only for current version of Capistrano
# lock '3.4.0'

# set :application, 'rb-flickr-integration-api'
# set :repo_url, 'git@github.com/manufarfaro/rb-flickr-integration-api.git'
# set :use_sudo,     false
# set :deploy_via,   :copy
# set :copy_exclude, '.git/*'
# set :stage,        :production

## Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/home/apps/#{fetch(:application)}"

# set :scm, :git
# set :branch, 'master'
# set :keep_releases, 5

# namespace :deploy do

#   after :restart, :clear_cache do
#     on roles(:web), in: :groups, limit: 3, wait: 10 do
#     end
#   end

# end
