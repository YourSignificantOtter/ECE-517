
load 'ruby_intro_18spring.rb'

def scores
  correct = 0
  wrong = 0
  full = 35

  # Q1
  begin
    double_elem([]) == [] ? correct += 1 : wrong += 1
  rescue StandardError
    wrong += 1
  end

  # Q2
  begin
    missing_num([0, 2, 3]) == 1 ? correct += 1 : wrong += 1
  rescue StandardError
    wrong += 1
  end

  # Q3
  begin
    check_product?([1, 2, 3], 6) == true ? correct += 1 : wrong += 1
  rescue StandardError
    wrong += 1
  end

  # Q4
  begin
    concatenate_words('Hello', 'Kugou') == 'Hello Kugou' ? correct += 1 : wrong += 1
  rescue StandardError
    wrong += 1
  end

  # Q5
  begin
    valid_parentheses?('{)') == false ? correct += 1 : wrong += 1
  rescue StandardError
    wrong += 1
  end

  # Q6
  begin
    longest_common_prefix(%w[a aa abc]) == 'a' ? correct += 1 : wrong += 1
  rescue StandardError
    wrong += 1
  end

  # Q7
  begin
    s1 = Student.new('Bob', '08:12 am')
  rescue StandardError
    s1 = nil
  end

  begin
    s1.arrive_classroom_on_time? == false ? correct += 1 : wrong += 1
  rescue StandardError
    wrong += 1
  end

  ((correct * full).to_f / (wrong + correct)).round(2)
end

puts scores
