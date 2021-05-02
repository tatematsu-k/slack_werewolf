require 'slack-ruby-client'
require 'erb'
require 'json'

Slack.configure do |config|
  # APIトークンを設定
  config.token = ENV['SLACK_BOT_OAUTH_TOKEN']
end

class SlackNotifier
  attr_accessor :channel

  def initialize(channel:)
    self.channel = channel
  end

  def post(template:, **args)
    erb = ERB.new(File.read("./src/slack_notifier_template/#{template}.erb"))
    template_result = JSON.parse(erb.result_with_hash(channel: channel, **args), symbolize_names: true)
    client.chat_postMessage(**template_result)
  end

  private

  def client
    @client ||= Slack::Web::Client.new
  end
end
