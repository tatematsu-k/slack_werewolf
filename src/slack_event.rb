require './src/slack_event/url_verification'
require './src/slack_event/event_callback'
require './src/slack_event/block_actions'

class SlackEvent
  def self.create(type:, **args)
    klass = const_get(type.split('_').map(&:capitalize).join)
    klass.new(type: type, **args)
  end
end
