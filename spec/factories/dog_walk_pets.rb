FactoryBot.define do
  factory :dog_walk_pet do
    name { 'Luna' }
    race { 'SRD' }
    age { 8 }
    observation { nil }
    dog_walk { build(:dog_walk) }
  end
end
