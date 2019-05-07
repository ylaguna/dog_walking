require 'rails_helper'

RSpec.describe DogWalk, type: :model do
  let(:dog_walk) { build(:dog_walk) }

  describe '#valid?' do
    subject { dog_walk.valid? }

    context 'when it has good params' do
      it { is_expected.to be true }
    end
  end
end
