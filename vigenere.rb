require 'pry'

class Vigenere
  attr_reader :message, :rotation, :character_map, :key_word

  def initialize(key_word, message)
    @key_word = key_word.downcase.chars
    @message = message.downcase.chars
    @character_map = ('a'..'z').to_a + [" ", ".", ",", "!"]
    rotation_of_key_word
  end

  def rotation_of_key_word
    @rotation = key_word.map { |letter| character_map.index(letter) + 1 }
  end

  def message_index
    message.map { |letter| character_map.index(letter)}
  end

  def rotation_for_encryption
    message_index.map.with_index {|num, index|
      (num + (rotation[index % 5]) ) % 30}
  end

  def vigenere
    rotation_for_encryption.map { |num| character_map[num]}
  end

end

if __FILE__ == $PROGRAM_NAME
  text = Vigenere.new("Bacon", "taylor Make PHP great again.")
  puts text.vigenere
end
