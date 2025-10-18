#!/bin/bash
set -e # エラーが発生した場合、すぐにスクリプトを終了する

echo "Waiting for database to be ready..."
./bin/wait-for-it.sh db:3306 -t 30

# データベースがなければ終了
echo "Running database setup and migrations..."
bin/rails db:create
bin/rails db:migrate

# Webサーバーの起動
echo "Starting Rails server..."
exec bundle exec rails s -p 80 -b '0.0.0.0'