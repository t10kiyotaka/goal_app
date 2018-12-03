# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..100).to_a.each do |i|
  User.create!(name: "sample-name-#{i}", email: "sample#{i}@text.com", password: "password")
end

100.times do |i|
  Goal.create!(description: "sample-#{i}", priority: 1,
    progress_percent: 50, user_id: 1)
end
