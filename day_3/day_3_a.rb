g = File.open('day_3_input').read

PRIORITY = [*'a'..'z', *'A'..'Z'].map.with_index { |i, j| [i, j + 1] }.to_h

result = 0

g.each_line do |l|
  div = l.length / 2
  chr = l.strip.chars
  intersec = chr.first(div).intersection(chr.last(div))
  result += PRIORITY[intersec[0]]
end

puts result
