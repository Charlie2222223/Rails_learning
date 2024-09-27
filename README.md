
## 環境構築手順

### ビルド
```bash
docker compose build --no-cache
```

### コンテナを起動
```bash
docker compose up
```

### データベースを作成
```bash
docker-compose exec web rails db:create
```

http://localhost:3000/ にアクセスしてブラウザにプロジェクトが表示されることを確認する

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
