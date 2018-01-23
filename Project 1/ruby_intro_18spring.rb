#******************* Arrays, Hashes, & Enumerables *******************#
def double_elem(array)
  if array.empty?
    return []
  elsif !array.all? {|i| i.is_a? Integer }
    raise ArgumentError.new("Only Integers allowed!")
  else
    array.map do |i| ; i * 2 ; end
  end
end

def missing_num(array)
  if array.empty?
    return 0
  elsif !array.all? {|i| i.is_a? Numeric}
    raise ArgumentError.new("Only Numerics allowed!")
  else
    last = -1; # this can def be better
    array.each do |i|
      if(i != last + 1)
        return i - 1;
      else
        last = last + 1
      end
    end
    return array[-1] + 1
    #do the comp
  end
end

require 'prime'
def check_product(array, n)
  raise ArgumentError.new("Only Integers allowed!") if !n.is_a? Integer or !array.all? {|i| i.is_a? Integer}

  if n.prime?
    false
  elsif
    array.combination(3).to_a.each do |i|
      return true if i.inject(:*) == n
    end
  end
end

#require 'regexp'
#******************* Strings & Regex *******************#
def concatenate_words(w1, w2)
  raise  ArgumentError.new("Only Strings allowed!") if !w1.is_a? String or !w2.is_a? String
  w1 + ' ' + w2
end

def valid_parentheses?(s)
  raise  ArgumentError.new("Only Strings allowed!") if !s.is_a? String
  return true if s.empty? # should this be true or false?
  s = s.chars.to_a
  s.each do |i|
    #do we need a stack?
    puts i
  end
end

def longest_common_prefix(s)
  raise  ArgumentError.new("Only Strings allowed!") if !s.all? {|i| i.is_a? String}
  return "" if s.empty?

end

#******************* Object Oriented Basics *******************#
class Student
  #attr_accessor :name
  #attr_accessor :arrival_time_at_classroom Don't think these will let us fit the requirements

  @name
  @arrival_time_at_classroom

  @@class_start_time = '08:00 am' #not needed?

  def initialize(name, arrival_time_at_classroom)
    raise ArgumentError.new if name.empty? or name.nil? or arrival_time_at_classroom.nil? or
        arrival_time_at_classroom.empty? or
        /^([0-9]|0[0-9]|1[0-2]):[0-5][0-9] [ap]m$/ !~ arrival_time_at_classroom #regex needs to be updated, currently doesn't enforce leading 0

    @name = name
    @arrival_time_at_classroom = arrival_time_at_classroom
  end

  def arrive_on_time_for_class?
    if @arrival_time_at_classroom =~ /^0[0-7]:\d\d am$/
      true
    else
      false
    end
  end

end

myStudent = Student.new("Nick", "07:59 am")
puts myStudent.arrive_on_time_for_class?


