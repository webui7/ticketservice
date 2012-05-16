# У вас должна быть настроена авторизация ssh по сертификатам

set :application, "rails"

# настройка системы контроля версий и репозитария, по умолчанию - git, если используется иная система версий, нужно изменить значение scm
set :scm, :git

set :repository,  "~/projects/ticketservice"
set :deploy_via, :copy
set :user, "XXXXXXXXX"
set :use_sudo, false
set :deploy_to, "/home/hosting_webui/projects/XXXXXXXXXX"


role :web, "XXXXXXXX.XXXXX.XX"   # Your HTTP server, Apache/etc
role :app, "XXXXXXXX.XXXXX.XX"   # This may be the same as your `Web` server
role :db,  "XXXXXXXX.XXXXX.XX", :primary => true # This is where Rails migrations will run

# эта секция для того, чтобы вы не хранили доступ к базе в системе контроля версий. Поместите dayabase.yml в shared,
# чтобы он копировался в нужный путь при каждом выкладывании новой версии кода
# так лучше с точки зрения безопасности, но если не хотите - прсото закомментируйте этот таск
set :default_environment, {
 'PATH' => "/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/sbin:/usr/local/bin:/usr/X11R6/bin:/$HOME/.gem/ruby/1.8/bin:/var/lib/gems/1.8/bin:/var/lib/gems/1.9.1/gems:/shared/gems/ruby/1.9.1/bin:/home/hosting_webui/.gem/ruby/1.8/bin:/$HOME/projects/bookmart/vendor/gems/ruby/1.9.1/bin:/home/hosting_webui/.gem/ruby/1.9.1/bin:/home/hosting_webui/.gem/ruby/1.9.1/gems"
}

# Если хотите поместить конфиг в shared и не хранить его в системе контроя версий - раскомментируйте следующие строки

#after "deploy:update_code", :copy_database_config

#task :copy_database_config, roles => :app do
#  db_config = "#{shared_path}/database.yml"
#  run "cp #{db_config} #{release_path}/config/database.yml"
#end

set :unicorn_conf, "/etc/unicorn/rails.webui.rb"
set :unicorn_pid, "/var/run/unicorn/rails.webui.pid"



  set :unicorn_start_cmd, "(cd #{deploy_to}/current; rvm use ruby-1.9.2-p290 do bundle exec unicorn_rails -Dc #{unicorn_conf})"



# - for unicorn - #
namespace :deploy do
  desc "Start application"
  task :start, :roles => :app do
    run unicorn_start_cmd
  end

  desc "Stop application"
  task :stop, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -QUIT `cat #{unicorn_pid}`"
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -USR2 `cat #{unicorn_pid}` || #{unicorn_start_cmd}"
  end
end
