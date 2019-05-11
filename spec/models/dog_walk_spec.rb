require 'rails_helper'

RSpec.describe DogWalk, type: :model do
  subject { described_class.new }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:latitude) }
  it { is_expected.to validate_presence_of(:longitude) }

  context 'when is builded by factory' do
    subject { create(:dog_walk) }
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:status) }
  end
end
