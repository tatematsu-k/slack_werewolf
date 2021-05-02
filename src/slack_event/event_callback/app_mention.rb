require './src/slack_notifier'
require './src/werewolf_event'

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
        werewolf_event&.reply

        {
          user: user,
          text: text,
          channel: channel,
        }
      end

      private

      def werewolf_event
        WerewolfEvent.create(
          notifier: reply_notifier,
          user: user,
          text: text,
        )
      end

      def reply_notifier
        SlackNotifier.new(channel: channel)
      end
    end
  end
end
