class SlackEvent
  class EventCallback
    class AppMention
      attr_accessor :user
      attr_accessor :text
      attr_accessor :channel

      def initialize(user:, text:, channel:, **args)
        @user = user
        @text = text
        @channel = channel
      end

      def call
        {
          user: user,
          text: text,
          channel: channel,
        }
      end
    end
  end
end
