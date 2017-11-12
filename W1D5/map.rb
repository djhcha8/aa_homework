class Map
  
  def initialize
    @map = []
  end
  
  def assign(key, value)
    @map.each do |pair|
      if pair[0] == key
        pair[1] = value
        return @map
      end
    end
    
    @map << [key,value]
  end
  
  def lookup(key)
    @map.select { |pair| return pair if pair[0] == key }
  end
  
  def remove(key)
    @map.each { |pair| @map.delete(pair) if pair[0] == key }
  end
  
  def show
    @map
  end
    
end