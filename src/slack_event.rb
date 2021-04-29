require './src/slack_event/url_verification'
require './src/slack_event/event_callback'

class SlackEvent
  def self.create(type:, **args)
    klass = const_get(type.split('_').map(&:capitalize).join)
    klass.new(type: type, **args)
  end
end
