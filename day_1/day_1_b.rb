g = File.open('day_1_input', 'r').read
stacc = []
mx = []
g.each_line do |l|
  if l == "\n"
    s = stacc.inject(0, :+)
    stacc = []
    mx << s
  else
    stacc << l.to_i
  end
end

puts mx.sort.reverse.first(3).inject(0, :+)
