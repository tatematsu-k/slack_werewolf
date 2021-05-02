require './src/werewolf_event/start_game'

class WerewolfEvent
  def self.create(**args)
    StartGame.new(**args)
  end
end
