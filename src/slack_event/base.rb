class SlackEvent
  class Base
    attr_accessor :type

    def initialize(type:, **args)
      @type = type
    end
  end
end
