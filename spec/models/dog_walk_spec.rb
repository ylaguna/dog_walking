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
    it { is_expected.to validate_presence_of(:duration) }
  end

  describe '#price' do
    subject { dog_walk.price }

    context 'when it has a half hour duration' do
      let(:dog_walk) { create(:dog_walk_one, duration: 'half_hour') }
      it { is_expected.to eq 25 }

      context 'when it has four pets' do
        let(:dog_walk) { create(:dog_walk_four, duration: 'half_hour') }
        it { is_expected.to eq 70 }
      end
    end

    context 'when it has a full hour duration' do
      let(:dog_walk) { create(:dog_walk_one, duration: 'full_hour') }
      it { is_expected.to eq 35 }

      context 'when it has four pets' do
        let(:dog_walk) { create(:dog_walk_four, duration: 'full_hour') }
        it { is_expected.to eq 95 }
      end
    end
  end
end
