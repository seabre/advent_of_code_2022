g = File.open('day_2_input', 'r').read

score = 0

score_chart = {'X' => 1, 'Y' => 2, 'Z' => 3}
MAP_CHART = {'X' => :rock, 'A' => :rock,
             'Y' => :paper, 'B' => :paper,
             'Z' => :scissors, 'C' => :scissors}

def game_result(yours, theirs)
  yours = MAP_CHART[yours]
  theirs = MAP_CHART[theirs]
  if yours == theirs
    3
  elsif theirs == :rock && yours == :scissors
    0
  elsif theirs == :rock && yours == :paper
    6
  elsif theirs == :paper && yours == :scissors
    6
  elsif theirs == :paper && yours == :rock
    0
  elsif theirs == :scissors && yours == :paper
    0
  elsif theirs == :scissors && yours == :rock
    6
  end
end

g.each_line.each do |l|
  theirs, yours =  l.strip.split(' ')

  score += score_chart[yours]
  score += game_result(yours, theirs)
end

puts score
