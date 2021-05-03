require 'slack'
require './src/http_response'

Slack::Events.configure do |config|
  config.signing_secret = ENV['SLACK_SIGNING_SECRET']
end

class SigningVerify
  attr_accessor :event

  def initialize(event)
    self.event = event
  end

  def verify!
    slack_request.verify!
  end

  private

  def slack_request
    @slack_request ||= Slack::Events::Request.new(http_response)
  end

  def http_response
    @http_response ||= HttpResponse.new(event)
  end
end
