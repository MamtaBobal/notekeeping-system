# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

600.times do |i|
  User.create(
               email: Faker::Internet.email,
               password: 123456
             )
end

3000.times do |i|
  Note.create(
                description: Faker::Movies::StarWars.quote
              )
end

3000.times do |i|
  begin UserNote.create(user_id: rand(1..200), note_id: rand(1..100), role: UserNote::roles.invert[0])
  rescue => error
    next
  end
end
