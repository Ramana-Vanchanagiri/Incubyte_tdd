class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    num_arr = numbers.split(/,|\n/).map(&:to_i)
    num_arr.sum
  end
end
