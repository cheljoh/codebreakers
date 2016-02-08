def initials(name)
  name.split(" ").map { |name| name[0] }.join
end
puts initials("Carly Rae Jepsen")
