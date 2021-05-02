require './src/werewolf_event/sample'

class WerewolfEvent
  def self.create(**args)
    Sample.new(**args)
  end
end
