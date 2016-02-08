require 'pry'

class Ceaser

  def initialize(rotation, message)
    @rotation = rotation
    @message = message.join.chars
    binding.pry
    @character_map = ('a'..'z').to_a
  end

end

if __FILE__ == $PROGRAM_NAME
  Ceaser.new(ARGV[0], ARGV[1..-1])
end
