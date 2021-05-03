require 'json'
require './src/signing_verify'
require './src/slack_event'

def webhook(event:, context:)
  body = JSON.parse(event["body"], symbolize_names: true)
  p "request params: #{body}"

  SigningVerify.new(event).verify!

  slack_event = SlackEvent.create(**body)
  {
    statusCode: 200,
    body: slack_event.call.to_json
  }
end
