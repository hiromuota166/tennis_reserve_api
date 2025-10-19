# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# テストユーザーの作成
10.times do |n|
  User.find_or_create_by(name: "テストユーザー#{n + 1}") do |user|
  end
end

# コートの作成
["Court A", "Court B", "Court C"].each do |court_name|
  Court.find_or_create_by(name: court_name) do |court|
  end
end
