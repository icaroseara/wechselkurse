require 'httparty'

module Wechselkurse
  class Base
    include HTTParty

    format :json

    DEFAULT_TARGET_CURRENCIES = %w(GBP CHF BRL EUR).freeze
    DEFAULT_BASE_CURRENCY = %w(USD)

    def exchange_rates(from, to=[])
      raise NotImplementedError
    end

    private
    def make_request endpoint, options
      response = self.class.get(endpoint, options)
      if response.success?
        return response
      else
        raise response.response
      end
    end
  end
end
