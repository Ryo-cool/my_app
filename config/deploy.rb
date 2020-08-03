# config valid for current version and patch releases of Capistrano
lock "~> 3.14.1"

# Capistranoのログの表示に利用する
set :application, 'my_app'

# デプロイ先のフォルダ
set :deploy_to, '/var/www/rails/my_app'

# どのリポジトリからアプリをpullするかを指定する
set :repo_url,  'https://github.com:Ryo-cool/my_app.git'

# バージョンが変わっても共通で参照するディレクトリを指定
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.5.8' 

# どの公開鍵を利用してデプロイするか
set :ssh_options,  forward_agent: true,
                  user: fetch(:user),
                  auth_methods: ['publickey'],
                  keys: ['~/.ssh/my-key.pem'] 

# プロセス番号を記載したファイルの場所
set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

# Unicornの設定ファイルの場所
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

# デプロイ処理が終わった後、Unicornを再起動するための記述
after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end
