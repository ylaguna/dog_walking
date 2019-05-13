FactoryBot.define do
  factory :dog_walk  do
    title { 'Passeio Legal no Ibira' }
    latitude { -23.5890092 }
    longitude { -46.6575506 }
    duration { 'half_hour' }

    after :create do |walk|
      create(:dog_walk_pet, dog_walk: walk)
      create(:dog_walk_pet, dog_walk: walk, name: 'dog02')
    end
  end

  factory :dog_walk_one, class: DogWalk  do
    title { 'Passeio Legal no Ibira' }
    latitude { -23.5890092 }
    longitude { -46.6575506 }
    duration { 'half_hour' }

    after :create do |walk|
      create(:dog_walk_pet, dog_walk: walk)
    end
  end

  factory :dog_walk_four, class: DogWalk  do
    title { 'Passeio Legal no Ibira' }
    latitude { -23.5890092 }
    longitude { -46.6575506 }
    duration { 'half_hour' }

    after :create do |walk|
      create(:dog_walk_pet, dog_walk: walk)
      create(:dog_walk_pet, dog_walk: walk)
      create(:dog_walk_pet, dog_walk: walk)
      create(:dog_walk_pet, dog_walk: walk)
    end
  end
end
