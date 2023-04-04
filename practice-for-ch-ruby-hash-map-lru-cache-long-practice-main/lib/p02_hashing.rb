class Integer
  # Integer#hash already implemented for you
end

class Array #assuming just an array of integers
  def hash
    hash = 0

    self.each_with_index do |ele, idx|
      hash = hash ^ (ele + idx)
    end

    hash

  end
end

class String
  def hash
    hash = 0
    alphabet = ("a".."z").to_a
    upcase_alphabet = ("A".."Z").to_a

    self.each_char.with_index do |char, idx|
      if alphabet.include?(char)
        char_alpha_idx = alphabet.index(char)
      else
        char_alpha_idx = upcase_alphabet.index(char) + alphabet.length
      end
      hash = hash ^ (char_alpha_idx + idx * 10)
    end

    hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method

  def alpha_to_int(string_char)
    alphabet = ("a".."z").to_a
    upcase_alphabet = ("A".."Z").to_a

    if alphabet.include?(string_char)
      char_alpha_idx = alphabet.index(string_char)
    else
      char_alpha_idx = upcase_alphabet.index(string_char) + alphabet.length
    end
  end

  def hash
    hash = 0

    self.each_pair do |key, value|
      key = key.to_s if key.is_a?(Symbol)
      if key.is_a?(String)
        key = key.chars.map { |char| alpha_to_int(char) }
        key = key.join
        key = key.to_i
      end

      value = value.to_s if value.is_a?(Symbol)
      if value.is_a?(String)
        value = value.chars.map { |char| alpha_to_int(char) }
        value = value.join
        value = value.to_i
      end

      hash = hash ^ (key * 3 + value * 10)
    end

    hash
  end
end