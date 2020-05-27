FactoryBot.define do
  factory :note do
    description                               { Faker::Movies::StarWars.quote }
  end
end
 