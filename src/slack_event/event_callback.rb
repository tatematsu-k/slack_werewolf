require './src/slack_event/base'

class SlackEvent
  class EventCallback < Base
    attr_accessor :event

    def initialize(event:, **args)
      super(**args)
      @event = EventFactory.create(**event)
    end

    def call
      event.call
    end

    require './src/slack_event/event_callback/app_mention'
    class EventFactory
      def self.create(type:, **args)
        klass = SlackEvent::EventCallback.const_get(type.split('_').map(&:capitalize).join)
        klass.new(type: type, **args)
      end
    end
  end
end
