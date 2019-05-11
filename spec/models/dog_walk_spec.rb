require 'rails_helper'

RSpec.describe DogWalk, type: :model do
  subject(:dog_walk) { build(:dog_walk) }

  it { is_expected.to be_valid }
end
