require 'rails_helper'

RSpec.describe Api::V1::DogWalkShowSerializer do
  subject(:serializer) { described_class.new(dog_walk) }

  let(:dog_walk) { create(:dog_walk) }

  describe '#serialize' do
    subject(:serialize) { serializer.serializable_hash }
    let(:serialized_hash) { serialize[:data][:attributes] }

    it 'should return the right keys' do
      expected_keys = [:id, :title, :scheduled_datetime,
                       :location, :started_at, :finished_at,
                       :walked_time, :price, :status, :pets]

      expect(serialized_hash.keys).to match_array expected_keys
    end

    describe '#pets' do
      subject(:pets) { serialized_hash[:pets] }

      it 'should return the right keys' do
        expected_keys = [:name, :race, :age, :observation]

        expect(pets.first.keys).to match_array expected_keys
      end
    end

    describe '#location' do
      subject(:location) { serialized_hash[:location] }

      it 'should return the right keys' do
        expected_keys = [:latitude, :longitude]

        expect(location.keys).to match_array expected_keys
      end
    end
  end
end
