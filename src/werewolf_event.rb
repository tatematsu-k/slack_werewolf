require './src/werewolf_event/start_game'

class WerewolfEvent
  CANDIDATE_CLASSES = [StartGame]

  def self.create(**args)
    CANDIDATE_CLASSES
      .filter { |klass| klass.match?(**args) }
      .first
      .new(**args)
  end
end
