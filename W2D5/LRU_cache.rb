class LRUCache
  def initialize(num)
    @size = num
    @cache = []
  end

  def count
    # returns number of elements currently in cache
    cache.count { |el| el }
  end

  def add(el)
    # adds element to cache according to LRU principle
    if cache.include?(el)
      cache.delete(el)
      cache << el
    elsif count >= size
      cache.shift
      cache << el
    else
      cache << el
    end
  end

  def show
    # shows the items in the cache, with the LRU item first
    p cache
    nil
  end

  private
  # helper methods go here!
  attr_accessor :cache
  attr_reader :size
end