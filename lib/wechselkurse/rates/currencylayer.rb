require 'money'

module Wechselkurse
  class Currencylayer < Base
    base_uri 'http://apilayer.net/api'

    DATE_REGEX = /\d{4}-\d{2}-\d{2}/.freeze

    def initialize
      @auth = { access_key: ENV["CURRENCYLAYER_ACCESS_KEY"]}
    end

    def exchange_rates(source:, currencies:, date: Date.today)
      validate_params(source, currencies, date)
      options = {
        query: {
          source: source,
          currencies: currencies.join(','),
          date: date
        }
      }
      options[:query].merge!(@auth)
      exchange_rates = raw_exchange_rates(options)
      Wechselkurse::Broadcaster.send_message exchange_rates
      exchange_rates
    end

    def exchange_rate(source:, currencies:, value:, date: Date.today)
      exchange_rates = exchange_rates(
        source: source,
        currencies: currencies,
        date: date
      )
      exchange_rate = exchange_rates[:quotes].map do |quote|
        { quote.key.to_sym => value * quote.value}
      end
      Wechselkurse::Broadcaster.send_message exchange_rate
      exchange_rate
    end

    def highest_exchange_rate(source:, target:)
      last_exchange_rates = last_seven_days.flat_map do |date|
        exchange_rates(source: source, currencies: target.to_a, date: date).last
      end
      highest_exchange_rate = last_exchange_rates.max_by{|code, value| value}
      Wechselkurse::Broadcaster.send_message highest_exchange_rate
      highest_exchange_rate
    end

    private

    def last_seven_days
      (Date.today-7..Date.today)
    end

    def validate_params(source, currencies, date)
      validate_currencies!(currencies.push(source))
      validate_date!(date)
    end

    def validate_currencies! currencies
      unless (currencies - valid_currencies).empty?
        raise Wechselkurse::Error::UnknownCurrency
      end
    end

    def validate_date! date
      return unless date
      unless date.to_s =~ DATE_REGEX && Date.parse(date.to_s)
        raise Wechselkurse::Error::InvalidDate
      end
    end

    def valid_currencies
      @valid_currencies ||= ::Money::Currency.table.keys.map do |code|
        code.to_s.upcase
      end
    end

    def raw_exchange_rates options
      response = make_request('/historical', options)
      {quotes: response['quotes']}
    end
  end
end
