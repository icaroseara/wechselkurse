require 'spec_helper'

describe Wechselkurse::Base do
  let(:base) { Wechselkurse::Base.new }
  let(:currencies) { %w(GBP CHF BRL EUR) }
  let(:source) { "USD" }

  describe '#exchange_rates' do
    subject { base.exchange_rates(source: source, currencies: currencies) }

    it 'raises a not implemented error' do
      expect{subject}.to raise_error NotImplementedError
    end
  end

  describe '#exchange_rate' do
    subject do
      base.exchange_rate(source: source, currencies: currencies, value: 10)
    end

    it 'raises a not implemented error' do
      expect{subject}.to raise_error NotImplementedError
    end
  end

  describe '#highest_exchange_rate' do
    subject do
      base.highest_exchange_rate(source: source, target: currencies.first)
    end

    it 'raises a not implemented error' do
      expect{subject}.to raise_error NotImplementedError
    end
  end
end
