# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Task.create!(title: "テストy", status: true, done_date: '2021-06-21', user_id: 4)
# Task.create!(title: "テストb", status: true, done_date: '2021-06-16', user_id: 4)
# Task.create!(title: "テストc", status: true, done_date: '2021-06-17', user_id: 4)
# Task.create!(title: "テストd", status: true, done_date: '2021-06-20', user_id: 4)
# Task.create!(title: "テストe", status: true, done_date: '2021-06-22', user_id: 4)