require 'pry'

class Caesar

  attr_reader :message, :rotation, :character_map, :words

  def initialize(rotation, message)
    @rotation = rotation
    @words = message.split(" ")
    @character_map = ('a'..'z').to_a
  end

  def wrap
    words.map{|word| word.chars.map{|letter| encrypt_character(letter)}.join("")}.join(" ")
  end
end

def encrypt_character(letter)
    if character_map.include?(letter.downcase)
      is_lower = letter.downcase == letter
      index = character_map.index(letter.downcase)
      new_index = (index + rotation) % 26
      new_letter = character_map[new_index]
      is_lower ? new_letter.downcase : new_letter.upcase #check case
    else
      letter
    end
end

if __FILE__ == $PROGRAM_NAME
  caesar = Caesar.new(13, "Be sure to drink you Ovaltine!")
  puts caesar.wrap
end
