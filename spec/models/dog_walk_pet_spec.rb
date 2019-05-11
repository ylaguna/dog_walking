require 'rails_helper'

RSpec.describe DogWalkPet, type: :model do
  subject { described_class.new }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:race) }
  it { is_expected.to validate_presence_of(:age) }

  context 'when is builded by factory' do
    subject { build(:dog_walk_pet) }
    it { is_expected.to be_valid }
  end
end
