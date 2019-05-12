require 'rails_helper'

RSpec.describe DogWalkingOperations::Toogle do
  subject(:operation) { described_class.new(result) }

  let(:result) { OperationResult.new }
  let(:params) { { dog_walk: dog_walk, new_status: new_status } }
  let(:new_status) { nil }
  let(:dog_walk) { create(:dog_walk) }

  it { is_expected.to be_an(Operation) }

  describe '#process' do
    subject(:process) { operation.process(params) }
    it { expect { process }.not_to raise_error }

    context 'when is valid' do
      before { expect(operation).to receive(:validate).once.and_return(true) }

      context 'when new status = started' do
        let(:new_status) { 'started' }
        it { expect { process }.to change { dog_walk.reload.status }.to('started') }
        it { expect { process }.to change { dog_walk.reload.started_at } }
        it { expect { process }.not_to change { dog_walk.reload.finished_at } }
      end

      context 'when new status = finished' do
        let(:new_status) { 'finished' }
        it { expect { process }.to change { dog_walk.reload.status }.to('finished') }
        it { expect { process }.not_to change { dog_walk.reload.started_at } }
        it { expect { process }.to change { dog_walk.reload.finished_at } }
      end
    end

    context 'when is invalid' do
      before { expect(operation).to receive(:validate).once.and_return(false) }
      it { expect { process }.not_to change { dog_walk.reload.status } }
    end
  end

  describe '#validate' do
    subject(:validate) { operation.validate(params) }
    it { expect { validate }.not_to raise_error }

    context 'when we pass an invalid status' do
      let(:new_status) { 'foo' }
      it { is_expected.to eq false }
    end

    context 'when we pass the same status' do
      let(:new_status) { 'started' }

      it 'is expected to eq false' do
        dog_walk.update_attribute(:status, 'started')
        expect(validate).to eq false
      end
    end

    context 'when we pass a finished walk' do
      let(:new_status) { 'started' }

      it 'is expected to eq false' do
        dog_walk.update_attribute(:status, 'finished')
        expect(validate).to eq false
      end
    end

    context 'when we pass good status' do
      let(:new_status) { 'started' }
      it { is_expected.to eq true }
    end
  end
end
