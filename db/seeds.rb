puts 'Creating Dog Walks'

100.times {
  DogWalk.create!(
    title: Faker::Lorem.sentence,
    scheduled_datetime: Faker::Time.between(2.days.ago, Date.today, :all)
  )
}

puts 'Done'
