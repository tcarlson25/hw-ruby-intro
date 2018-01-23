# When done, submit this entire file to the autograder.

# Part 1

def sum arr
    return 0 if arr.empty?
    return arr.inject { |memo, var|  memo + var }
end

def max_2_sum arr
    return 0 if arr.empty?
    return arr[0] if arr.length == 1
    sum = 0
    2.times {
        value_index = arr.each_with_index.max
        sum += value_index[0]
        arr.delete_at(value_index[1])
    }
    return sum
end

def sum_to_n? arr, n
    return false if arr.empty?
    return arr.combination(2).any? do |num1, num2|
        num1 + num2 == n
    end
end

# Part 2

def hello(name)
    return "Hello, " + name
end

def starts_with_consonant? s
    return false if s.empty?
    # check if consonant and if a letter using regexp
    return true if (s !~ /\A[aeiouAEIOU]/) && (s =~ /\A[a-zA-Z]/)
    return false
end

def binary_multiple_of_4? s
    # check for invalid binary number
    return false if s.chars.any? { |char| char !~ /[01]/ }
    return false if s.eql?('')

    # check for multiple when single digit
    if s.length == 1
        return true if s == '0'
        return false
    end

    # check for multiple when multiple digits
    last_two = s[s.length-2,2]
    return false if last_two != "00"
    return true
end

# Part 3

class BookInStock
    attr_accessor :isbn, :price

    def initialize(isbn, price)
        if isbn.eql?('') || price <= 0
            raise(ArgumentError, "ISBN cannot be empty string")
        end
        @isbn = isbn
        @price = price
    end

    def price_as_string
        formatted_price = "$"
        found_decimal = false
        price_array = @price.to_s.chars
        price_array.each_with_index do |v, i|
            if v == '.'
                found_decimal = true
            end
            if !found_decimal
                formatted_price += v.to_s
            else
                # if the price only has one decimal value
                if price_array.length == (i + 2)
                    formatted_price += "." + price_array[i+1] + "0"
                    break
                # if the price has more than one decimal value
                else
                    formatted_price += "." + price_array[i+1] + price_array[i+2]
                    break
                end
            end
        end
        # check if decimal was never found
        if !found_decimal
            formatted_price += ".00"
        end
        return formatted_price
    end

end
