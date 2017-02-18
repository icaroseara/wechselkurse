module Wechselkurse::Notifiers
  module BaseNotifier
    def send_notification message
      raise NotImplementedError
    end
  end
end
