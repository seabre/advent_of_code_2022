g = File.open('day_1_input', 'r').read
stacc = []
mx = 0
results = []
g.each_line do |l|
  if l == "\n"
    s = stacc.inject(0, :+)
    if s > mx
      mx = s
      results = stacc.dup
    end

    stacc = []
  else
    stacc << l.to_i
  end
end

puts mx
puts results.inspect
