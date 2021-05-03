require 'json'
require 'base64'
require './src/signing_verify'
require './src/slack_event'

def webhook(event:, context:)
  body = JSON.parse(URI.decode_www_form(Base64.decode64(event["body"])).to_h["payload"], symbolize_names: true)
  p "request params: #{body}"

  # SigningVerify.new(event).verify!

  slack_event = SlackEvent.create(**body)
  {
    statusCode: 200,
    body: slack_event.call.to_json
  }
end
