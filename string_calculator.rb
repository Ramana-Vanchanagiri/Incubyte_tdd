class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = /,|\n/

    if numbers.start_with?("//")
      header, numbers = numbers.split("\n", 2)
      custom_delimiter = header[2..]
      delimiter = Regexp.escape(custom_delimiter)
    end

    num_arr = numbers.split(/#{delimiter}|\n/).map(&:to_i)

    negatives = num_arr.select { |n| n < 0 }
    raise "Negative numbers not allowed: #{negatives.join(',')}" unless negatives.empty?

    num_arr.sum
  end
end
