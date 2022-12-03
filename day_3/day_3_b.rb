g = File.open('day_3_input').read
#g = File.open('tst').read

PRIORITY = [*'a'..'z', *'A'..'Z'].map.with_index { |i, j| [i, j + 1] }.to_h

result = 0
buf = []
g.each_line do |l|
  buf << l.strip.chars

  if buf.length == 3
    result += PRIORITY[buf[2].intersection(buf[0].intersection(buf[1]))[0]]
    buf = []
  end
end

puts result
