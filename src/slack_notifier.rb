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
    chat_post_message(**template_result)
  end

  private

  def chat_post_message(**args)
    p "slack post request with: #{args}"
    client.chat_postMessage(**args).tap do |res|
      p "slack post res: #{res}"
    end
  end

  def client
    @client ||= Slack::Web::Client.new
  end
end
