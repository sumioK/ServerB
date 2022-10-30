# ServerB課題

## 概要

### バージョン情報
* ruby:3.1.2  
* Rails:7.0.4  
* sqlite3:1.4  
* RSpec:3.12.0  
* selenium-webdriber:4.5.0

### テスト
* model spec
* system spec

## 起動方法
1. git cloneでソースコードをローカルに保存し、Server_Bディレクトリへ移動してください  
2. docker-compose build コマンドでコンテナを作成してください  
3. docker-compose up -dコマンドでコンテナをdaemonモードで起動してください  
4. docker-compose exec web bashコマンドでコンテナ内に移動してください
5. bundle コマンドでbundleをinstallしてください
6. rails db:migrateでDBをマイグレートしてください
7. rails s -b 0.0.0.0コマンドでサーバーを起動してください
8. localhost:3000にアクセスしてください
