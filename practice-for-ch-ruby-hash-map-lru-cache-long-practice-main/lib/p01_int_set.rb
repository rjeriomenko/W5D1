class MaxIntSet
  attr_reader :store #completely unnecessary, besides for the spec
  def initialize(max)
    @max = max
    @store = []
    booleans_to_pass = max.dup


    until booleans_to_pass == 0
      @store << false
      booleans_to_pass -= 1
    end
  end

  def insert(num)
    raise ArgumentError.new "Out of bounds" unless is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
    num <= @max && num > 0
  end

  def validate!(num)
  end
end

class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    unless include?(num)
      idx = num % num_buckets
      self[idx] << num
    end
  end

  def remove(num)
    if include?(num)
      idx = num % num_buckets
      self[idx].delete(num)
    end
  end

  def include?(num)
    idx = num % num_buckets 
    self[idx].include?(num)
  end

  private

  def [](num) # optional but useful; return the bucket corresponding to `num`
    @store[num]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless self.include?(num)
      resize! if num_buckets == @count
      bucket_idx = num % num_buckets
      self[bucket_idx] << num 
      @count += 1
    end
  end

  def remove(num)
    if self.include?(num)
      bucket_idx = num % num_buckets
      self[bucket_idx].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    bucket_idx = num % num_buckets
    self[bucket_idx].include?(num)
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
    num_temp_buckets = num_buckets * 2
    temp_buckets = Array.new(num_temp_buckets) { Array.new }

    @store.each do |bucket|
      bucket.each do |num|
        temp_bucket_idx = num % num_temp_buckets
        temp_buckets[temp_bucket_idx] << num
      end
    end

    @store = temp_buckets
  end

  def [](num) # optional but useful; return the bucket corresponding to `num`
    @store[num]
  end


end