require './src/werewolf_event/base'

class WerewolfEvent
  class StartGame < Base
    def self.match?(**args)
      true
    end

    def reply
      notifier.post(
        template: "start_game",
      )
    end
  end
end
