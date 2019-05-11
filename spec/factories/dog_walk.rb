FactoryBot.define do
  factory :dog_walk  do
    title { 'Passeio Legal no Ibira' }

    after :create do |walk|
      create(:dog_walk_pet, dog_walk: walk)
      create(:dog_walk_pet, dog_walk: walk, name: 'dog02')
    end
  end
end
