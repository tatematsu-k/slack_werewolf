require 'json'
require 'slack'
require './src/slack_event'
require './http_response'

Slack::Events.configure do |config|
  config.signing_secret = ENV['SLACK_SIGNING_SECRET']
end

def webhook(event:, context:)
  body = JSON.parse(event["body"], symbolize_names: true)
  p "request params: #{body}"

  verify_slack_request!(HttpResponse.new(event))

  slack_event = SlackEvent.create(**body)
  {
    statusCode: 200,
    body: slack_event.call.to_json
  }
end

def verify_slack_request!(http_request)
  slack_request = Slack::Events::Request.new(http_request)
  slack_request.verify!
end
