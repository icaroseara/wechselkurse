module Wechselkurse::Notifiers
  class SlackNotifier
    include BaseNotifier
    
    def initialize
      @notifier = Slack::Notifier.new(ENV['SLACK_WEBHOOK_URL'],
                                     channel: ENV['SLACK_CHANNEL'],
                                     username: ENV['SLACK_USERNAME'])
    end

    def send_notification message
      @notifier.ping message
    end
  end
end
