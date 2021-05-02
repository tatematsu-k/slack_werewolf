require './src/werewolf_event/base'

class WerewolfEvent
  class Sample < Base
    def reply
      notifier.post(
        text: text,
      )
    end
  end
end
