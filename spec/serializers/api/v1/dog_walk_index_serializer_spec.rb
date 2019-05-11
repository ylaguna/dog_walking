require 'rails_helper'

RSpec.describe Api::V1::DogWalkIndexSerializer do
  subject(:serializer) { described_class.new(dog_walk) }

  let(:dog_walk) { create(:dog_walk) }

  describe '#serialize' do
    subject(:serialize) { serializer.serializable_hash }
    let(:serialized_hash) { serialize[:data][:attributes] }

    it 'should return the right keys' do
      expected_keys = [:id, :title, :scheduled_datetime, :pets_count ]
      expect(serialized_hash.keys).to match_array expected_keys
    end

    describe '#pets_count' do
      subject { serialized_hash[:pets_count] }

      context 'when it has no pets' do
        before { dog_walk.pets.destroy_all }
        it { is_expected.to eq 0  }
      end

      context 'when have two pets' do
        it { is_expected.to eq 2  }
      end
    end
  end
end
