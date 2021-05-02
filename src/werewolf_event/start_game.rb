require './src/werewolf_event/base'

class WerewolfEvent
  class StartGame < Base
    def reply
      notifier.post(
        template: "start_game",
      )
    end
  end
end
