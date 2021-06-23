# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Task.create!(title: "テストx", status: true, done_date: '2021-06-21', user_id: 4)
Task.create!(title: "テスト2", status: true, done_date: '2021-06-21', user_id: 4)
Task.create!(title: "テスト3", status: true, done_date: '2021-06-20', user_id: 4)
Task.create!(title: "テスト4", status: true, done_date: '2021-06-20', user_id: 4)
Task.create!(title: "テスト5", status: true, done_date: '2021-06-19', user_id: 4)