g = File.open('day_2_input', 'r').read

score = 0

score_chart = {:rock => 1, :paper => 2, :scissors => 3}
MAP_CHART = {'X' => :lose, 'A' => :rock,
             'Y' => :draw, 'B' => :paper,
             'Z' => :win, 'C' => :scissors}

def choose_yours(yours, theirs)
  yours = MAP_CHART[yours]
  theirs = MAP_CHART[theirs]
  if yours == :draw
    theirs
  elsif yours == :lose && theirs == :rock
    :scissors
  elsif yours == :lose && theirs == :paper
    :rock
  elsif yours == :lose && theirs == :scissors
    :paper
  elsif yours == :win && theirs == :rock
    :paper
  elsif yours == :win && theirs == :paper
    :scissors
  elsif yours == :win && theirs == :scissors
    :rock
  end
end

def game_result(yours, theirs)
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

  new_yours = choose_yours(yours, theirs)
  score += score_chart[new_yours]
  score += game_result(new_yours, MAP_CHART[theirs])
end

puts score
