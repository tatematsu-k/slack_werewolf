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

    def reply(**args)
      notifier.post(
        template: self.class.name.gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').downcase,
        **args
      )
    end
  end
end
