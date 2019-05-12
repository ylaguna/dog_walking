require 'rails_helper'

describe OperationResult do
  let(:result) { described_class.new }

  describe '#add_error' do
    it 'increment the errors' do
      expect { result.add_error('foo') }.to change { result.errors }.to ['foo']
    end
  end

  context 'when it have errors' do
    before { result.add_error('foo') }
    it { expect(result.success?).to eq(false) }
    it { expect(result.failure?).to eq(true) }
  end

  context 'when it doesnt have errors' do
    it { expect(result.success?).to eq(true) }
    it { expect(result.failure?).to eq(false) }
  end
end
