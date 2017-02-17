module Wechselkurse
  class Currencylayer < Base
    base_uri 'http://apilayer.net/api'

    def initialize access_key:
      @auth = { access_key: access_key }
    end

    def exchange_rates(source=DEFAULT_BASE_CURRENCY, currencies=DEFAULT_TARGET_CURRENCIES, date)
      options = { query: { source: source, currencies: currencies.join(',')}}
      options[:query].merge!(@auth)
      @exchange_rates ||= raw_exchange_rates(options)
    end

    private

    def raw_exchange_rates options
      response = make_request('/historical', options)
      {source: response['source'], quotes: response['quotes']}
    end
  end
end
