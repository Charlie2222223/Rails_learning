# Rails.rootを使用するために必要
require File.expand_path(File.dirname(__FILE__) + '/environment')

# cronを実行する環境変数
rails_env = :development  # 本番環境で実行したい場合は :production に変更

# 必要な環境変数を個別に設定
env 'RAILS_ENV', rails_env.to_s
env 'GEM_PATH', ENV['GEM_PATH']
env 'GEM_HOME', ENV['GEM_HOME']
env 'PATH', ENV['PATH']

# cronを実行する環境変数をセット
set :environment, rails_env

# cronのログの吐き出し場所
set :output, "#{Rails.root}/log/cron.log"

# 1分毎にrakeタスクを実行
every 1.minute do # 注意: '1.minutes' から '1.minute' に変更
  rake 'import:users'
end

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
