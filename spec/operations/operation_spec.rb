require 'rails_helper'

RSpec.describe Operation do
  let(:result) { OperationResult.new }
  let(:params) { {} }
  let(:operation) { described_class.new(result) }

  context 'when is not overwrite' do
    it { expect { operation.process(params) }.to raise_error(NotImplementedError) }
    it { expect { operation.validate(params) }.to raise_error(NotImplementedError) }
  end

  describe '#run' do
    let(:run) { operation.run(params) }

    before { expect(operation).to receive(:validate).once.and_return(nil) }

    context 'when it is valid' do
      before { expect(result).to receive(:success?).once.and_return(true) }

      it 'calls process' do
        expect(operation).to receive(:process).once.and_return(nil)
        run
      end
    end

    context 'when is invalid' do
      before { expect(result).to receive(:success?).once.and_return(false) }

      it 'does not call process' do
        expect(operation).to_not receive(:process)
        run
      end
    end

    context 'when process raises something' do
      before do
        expect(result).to receive(:success?).once.and_return(true)
        allow(operation).to receive(:process).once.and_raise('foo')
      end

      it 'threats the error in Operation::Result' do
        expect { run }.to_not raise_error
        expect(result.errors).to include('foo')
      end
    end
  end

  context 'when something throws a :abort' do
    let(:run) { operation.run(params) }
    before { expect(operation).to receive(:validate).once.and_throw(:abort) }

    it 'catches and do not continue' do
      expect(operation).to_not receive(:process)
      expect { run }.to_not change { result.errors }
    end
  end

  describe '#abort' do
    context 'when it have a message' do
      it 'add as an error and throws' do
        message = 'throwable potatoe'

        expect { operation.abort!(message) }.to throw_symbol(:abort)
        expect(result.errors).to eq([message])
      end
    end

    context 'when it dont have a message' do
      it 'just throws' do
        expect { operation.abort! }.to throw_symbol(:abort)
        expect(result.errors).to eq([])
      end
    end
  end
end
