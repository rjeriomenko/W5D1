class Integer
  # Integer#hash already implemented for you
end

class Array #assuming just an array of integers
  def hash
    # test = []
    # self.each { |ele| test << ele.to_s(2) }

    # test.each do |hashed_ele|
    #   hashed_ele.to_i(2)
    # end

    [stuff]
    hash = 100000000000000000000000000000 #1 with 29 0's
    self.each do |ele|
      hash = hash ^ ele

  end
end

class String
  def hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end