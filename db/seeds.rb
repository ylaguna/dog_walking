puts 'Creating Dog Walks'

ActiveRecord::Base.transaction do
  100.times do
    dog_walk = DogWalk.create(
      title: Faker::Lorem.sentence,
      scheduled_datetime: Faker::Time.between(2.days.ago, 2.days.from_now, :all),
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude
    )

    rand(1..3).times do
      DogWalkPet.create(
        name: Faker::Creature::Dog.name,
        race: Faker::Creature::Dog.breed,
        observation: Faker::Creature::Dog.meme_phrase,
        age: rand(0..20),
        dog_walk: dog_walk
      )
    end
  end
end

puts 'DONE'
