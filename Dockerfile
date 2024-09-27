FROM ruby:3.2.2

# 必要なパッケージをインストール
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs chromium cron --fix-missing

# アプリケーション用のディレクトリを作成
RUN mkdir /myapp
WORKDIR /myapp

# GemfileとGemfile.lockを追加し、bundlerを実行
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

# アプリケーションのソースコードを追加
ADD . /myapp

# Cronサービスをバックグラウンドで実行
CMD ["cron", "-f"]