require 'rails_helper'

RSpec.describe DogWalkingOperations::Create do
  subject(:operation) { described_class.new(result) }

  let(:result) { OperationResult.new }
  let(:params) { {} }

  it { is_expected.to be_an(Operation) }

  describe '#process' do
    subject(:process) { operation.process(params) }
    it { expect { process }.not_to raise_error }

    context 'when is valid' do
      before { expect(operation).to receive(:validate).once.and_return(true) }
    end

    context 'when is invalid' do
      before { expect(operation).to receive(:validate).once.and_return(false) }
    end
  end

  describe '#validate' do
    subject(:validate) { operation.validate(params) }
    it { expect { validate }.not_to raise_error }
  end
end
