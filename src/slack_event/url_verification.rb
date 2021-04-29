require './src/slack_event/base'

class SlackEvent
  class UrlVerification < Base
    attr_accessor :challenge

    def initialize(challenge:, **args)
      super(**args)
      @challenge = challenge
    end

    def call
      {
        challenge: challenge,
      }
    end
  end
end
