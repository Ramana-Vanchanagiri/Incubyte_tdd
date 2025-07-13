class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    if numbers.start_with?("//")
      header, numbers = numbers.split("\n", 2)
      custom_delimiter = header[2..]

      parts = numbers.split(custom_delimiter)

      if parts.size == 1 && numbers.match?(/\d+[^\d]/)
        raise "Delimiter mismatch: please use only the specified delimiter."
      end

      num_arr = parts.map(&:to_i)
    else
      num_arr = numbers.split(/,|\n/).map(&:to_i)
    end

    negatives = num_arr.select { |n| n < 0 }
    raise "Negative numbers not allowed: #{negatives.join(',')}" if negatives.any?

    num_arr.sum
  end
end
