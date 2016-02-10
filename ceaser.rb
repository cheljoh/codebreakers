require 'pry'

class Ceaser
  attr_reader :message, :rotation, :character_map
  def initialize(rotation, message)
    @rotation = rotation
    @message = message.downcase.chars
    @character_map = ('a'..'z').to_a + [" ", ".", ",", "!"]
  end

  def wrap
    message.map { |letter| index = character_map.index(letter)
                       new_index = (index + rotation) % 30
                       character_map[new_index]
                }.join
  end
end

if __FILE__ == $PROGRAM_NAME
  ceaser = Ceaser.new(13, "Be sure to drink you Ovaltine!")
  puts ceaser.wrap
end
