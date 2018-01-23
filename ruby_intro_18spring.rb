def double_elem(array)
  if array.empty?
    return []
  elsif array.all? {|i| i.is_a? Numeric }
    array.map do |i| ; i * 2 ; end
  else
    raise ArgumentError.new("Only Numeric allowed!")
  end
end


x = [1,2,3,4]
y = []
z = [1, 'a', x]

puts double_elem x
puts double_elem y
puts double_elem z

def missing_num(array)
  if array.empty?
    return 0
  elsif
    array.all? {|i| i.is_a? Numeric}
    comp = 1..array.length
    #do the comp
  else
    raise ArgumentError.new("Only Numeric allowed!")
  end
end