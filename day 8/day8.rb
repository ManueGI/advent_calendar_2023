input = File.read('input.txt')
split = input.split("\n")

instructions = split[0].split("")


data = split[1..-1]


next_step = "AAA"
count = 0

while next_step != "ZZZ"

  index = 0

  instructions.each do |instruction|

    tests = data.map { |t| t.scan(/[A-Z]{3}/) }

    if instruction == "L"
      next_step = tests.find { |t| t[0] == next_step }[1]

    elsif instruction == "R"
      next_step = tests.find { |t| t[0] == next_step }[2]

    end
    count += 1
  end
end

puts "You need #{count} steps to reach ZZZ"
