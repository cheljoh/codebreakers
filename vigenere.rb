require 'pry'

class Vigenere
  attr_reader :message, :rotation, :character_map, :key_word

  def initialize(key_word, message)
    @key_word = key_word.downcase.chars
    @message = message.downcase.chars
    @character_map = ('a'..'z').to_a
    rotation_of_key_word
  end

  def rotation_of_key_word
    @rotation = key_word.map { |letter| index = character_map.index(letter) + 1 }
  end

  def vigenere
    message.map { |letter| index = (character_map.index(letter) + 1)
                       new_index = rotation.map { |num| index + num }
                      #  full_index = new_index % message.length -- look into counterg
                       message.map { |index| character_map[index] }
                }.join
  end
end

if __FILE__ == $PROGRAM_NAME
  text = Vigenere.new("Bacon", "Be sure to drink you Ovaltine!")
  puts text.vigenere
end
