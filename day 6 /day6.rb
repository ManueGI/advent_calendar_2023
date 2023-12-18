input = File.read('input.txt')

races = input.split("\n\n")

ways_to_beat_record = []
total_ways_to_beat_record = []

def boat_speed(hold, time)
  moving_time = time - hold
  if hold == 0
    distance = 0
  elsif hold == time
    distance = 0
  else
    distance = hold * moving_time
  end
  return distance
end

# PART 1

races.each do |race|

  race_data = race.split("\n")
  times = race_data[0].split.map(&:to_i)
  times = times[1..-1]
  distances = race_data[1].split.map(&:to_i)
  distances = distances[1..-1]

  times.zip(distances).each do |time, record_distance|

    ways_for_pair = 0

    (0..time).each do |hold|
      boat_speed_result = boat_speed(hold, time)

      if boat_speed_result >= record_distance
        ways_for_pair += 1
      end
    end

    ways_to_beat_record << ways_for_pair

  end
end

puts "Total ways to beat the record: #{ways_to_beat_record.reduce('*')}"

# PART 2

ways_to_beat_record = 0

races.each do |race|

  race_data = race.split("\n")
  time = race_data[0].gsub(/\D/, '').to_i
  distance = race_data[1].gsub(/\D/, '').to_i

  print time
  print distance


    (0..time).each do |hold|
      boat_speed_result = boat_speed(hold, time)

      if boat_speed_result >= distance
        ways_to_beat_record += 1
      end
    end
end

puts "Total ways to beat the record: #{ways_to_beat_record}"
