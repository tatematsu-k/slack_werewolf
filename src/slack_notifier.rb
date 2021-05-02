require 'slack-ruby-client'

Slack.configure do |config|
  # APIトークンを設定
  config.token = ENV['SLACK_BOT_OAUTH_TOKEN']
end

class SlackNotifier
  attr_accessor :channel

  def initialize(channel:)
    self.channel = channel
  end

  def post(text:)
    client.chat_postMessage(channel: channel, text: text, as_user: true)
  end

  private

  def client
    @client ||= Slack::Web::Client.new
  end
end
