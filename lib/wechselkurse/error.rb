module Wechselkurse
  class Error < StandardError
    UnknownCurrency = Class.new(self)
    InvalidDate = Class.new(self)
  end
end
