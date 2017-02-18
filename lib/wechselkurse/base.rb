require 'httparty'

module Wechselkurse
  class Base
    include HTTParty

    format :json

    def exchange_rates(source:, currencies:, date: nil)
      raise NotImplementedError
    end

    def exchange_rate(source:, currencies:, value:, date: nil)
      raise NotImplementedError
    end

    def highest_exchange_rate(source:, target:)
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
