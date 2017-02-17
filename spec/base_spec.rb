describe Wechselkurse::Base do
  let(:base) { Wechselkurse::Base.new }

  describe '#exchange_rates' do
    subject { base.exchange_rates }

    it 'raises a not implemented error' do
      is_expected.to raise_error NotImplementedError
    end
  end
end
