class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = /,|\n/
    if numbers.start_with?("//")
      header, numbers = numbers.split("\n", 2)
      custom_delimiter = Regexp.escape(header[2..])
      delimiter = /#{custom_delimiter}/
    end

    tokens = numbers.split(delimiter)

    num_arr = tokens.map do |token|
      case token
      when /\A-?\d+\z/
        token.to_i
      when /\A\d+\+\d+\z/
        token.split('+').map(&:to_i).sum
      when /\A\d+\*\d+\z/
        token.split('*').map(&:to_i).inject(:*)
      else
        raise "Delimiter mismatch: please use only the specified delimiter."
      end
    end

    negatives = num_arr.select { |n| n < 0 }
    raise "Negative numbers not allowed: #{negatives.join(',')}" if negatives.any?

    num_arr.sum
  end
end
