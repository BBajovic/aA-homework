class LRUCache
  def initialize(size)
    @store = Array.new(size)
    @size = size
  end

  def count
    # returns number of elements currently in cache
    @store.count
  end

  def add(el)
    # adds element to cache according to LRU principle
    if include?(el)
      delete(el)
      @store.push(el)
    else
      remove if count = @size
      @store.push(el)
    end
  end

  def show
    # shows the items in the cache, with the LRU item first
    @store
  end

  private
  # helper methods go here!
  def remove
    @store.shift
  end

  def include?(el)
    @store.include?(el)
  end

  def delete(el)
    @store.delete(el)
  end

end
