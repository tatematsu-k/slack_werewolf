require './src/slack_event/base'

class SlackEvent
  class BlockActions < Base
    attr_accessor :response_url
    attr_accessor :actions

    def initialize(response_url:, actions:, **args)
      super(**args)
      @response_url = response_url
      @actions = actions
    end

    def call
      {
        hoge: "hoge2"
      }
    end
  end
end
