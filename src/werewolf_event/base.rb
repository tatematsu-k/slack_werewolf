class WerewolfEvent
  class Base
    attr_accessor :notifier
    attr_accessor :text
    attr_accessor :user

    def initialize(user:, text:, notifier:, **args)
      self.user = user
      self.text = text
      self.notifier = notifier
    end
  end
end
