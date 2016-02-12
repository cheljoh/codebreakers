
class Initials

  def get_initials(name)
    name.split(" ").map { |name| name[0] }.join
  end

end

if __FILE__ == $PROGRAM_NAME
  text = Initials.new.get_initials("Carly Rae Jepsen")
  puts text
end
