set :deploy_to, "/home/user58/rails"
set :application, "wagn.invisible.ch"

set :user, "user58"

role :web, "user58@moria.invisible.ch"
role :app, "user58@moria.invisible.ch"
role :db,  "user58@moria.invisible.ch", :primary => true



set :use_sudo, false
set :keep_releases, 4

set :scm, :git
set :branch, "devel"
set :repository, "git@github.com:inv/wagn.git"
set :deploy_via, :remote_cache

namespace :deploy do
  desc "Create the database yaml file"
  task :after_update_code do
    db_config = <<-EOF
production:
  adapter: mysql
  encoding: utf8
  username: user58
  password: oruv6pqq"
  database: wagn_invisible_ch_prod
  host: 77.95.121.153
EOF

    put db_config, "#{release_path}/config/database.yml"   
  end

  # Restart passenger on deploy
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end

end