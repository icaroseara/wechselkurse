module Wechselkurse
  class Broadcaster
    class << self
      def send_message message
        notifiers.each do |notifier_klass|
          notifier_klass.new.send_notification(message)
        end
      end

      private
      def notifiers
        Wechselkurse::Notifiers.constants.select do |notifier|
          Wechselkurse::Notifiers.const_get(notifier).is_a? Class
        end
      end
    end
  end
end
