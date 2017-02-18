require 'spec_helper'

describe Wechselkurse::Currencylayer do
  let(:currencylayer) { Wechselkurse::Currencylayer.new }

  describe '#exchange_rates' do
    let(:currencies) { %w(GBP CHF BRL EUR) }
    let(:source) { "USD" }

    subject do
      currencylayer.exchange_rates(
        source: source,
        currencies: currencies
      )
    end

    context 'with valid params' do
      it 'returns the exchange_rates from a given source currency' do
        VCR.use_cassette('exchange_rates') do
          is_expected.to be_truthy
        end
      end
    end

    context 'with invalid params' do
      context 'with invalid source currency' do
        let(:source) { "DSU" }

        it 'raises unknown currency error' do
          expect{subject}.to raise_error Wechselkurse::Error::UnknownCurrency
        end
      end

      context 'with invalid currencies' do
        let(:currencies) { %w(GBP CHF BRL ZIP) }

        it 'raises unknown currency error' do
          expect{subject}.to raise_error Wechselkurse::Error::UnknownCurrency
        end
      end
    end

    context 'with a given date' do
      subject do
        currencylayer.exchange_rates(
          source: source,
          currencies: currencies,
          date: date
        )
      end

      context 'with valid date' do
        let(:date) { Date.today.to_s }

        it 'returns the exchange_rates from a given source currency' do
          VCR.use_cassette('exchange_rates_by_date') do
            is_expected.to be_truthy
          end
        end
      end

      context 'with invalid date' do
        let(:date) { '01-01-2017' }

        it 'raises invalid date errror' do
          expect{subject}.to raise_error Wechselkurse::Error::InvalidDate
        end
      end
    end
  end

  describe '#exchange_rate' do
  end

  describe '#highest_exchange_rate' do
  end
end
