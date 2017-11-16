require "byebug"

FISH = [
  'fish', 
  'fiiish',
  'fiiiiish',
  'fiiiish',
  'fffish',
  'ffiiiiisshh',
  'fsh',
  'fiiiissshhhhhh'
]

def sluggish
  longest = false
  until longest == true
    FISH.each_with_index do |f1, i1|
      longest = true
      FISH.each_with_index do |f2, i2|
        next if i1 == i2
        longest = false if f2.length > f1.length
      end
      
      return f1 if longest == true
    end
  end
end


class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |x,y| x <=> y }
    return self if self.length <= 1
    
    middle = self.length / 2
    left = self.take(middle)
    right = self.drop(middle)
    
    self.merge(left.merge_sort(&prc), right.merge_sort(&prc), &prc)
  end
  
  def merge(left, right, &prc)
    sorted = []
    
    until left.empty? || right.empty?
      case prc.call(left.first.length, right.first.length)
      when -1
        sorted << left.shift
      when 0
        sorted << left.shift
      when 1
        sorted << right.shift
      end
    end
    
    sorted + left + right
  end
end

def dominant  
  FISH.merge_sort.last
end

def clever
  longest = nil
  FISH.each do |f|
    longest = f if longest == nil
    longest = f if f.length > longest.length
  end
  
  longest
end



def slow_dance(direction)
  tiles_array = [
    "up", 
    "right-up", 
    "right", 
    "right-down", 
    "down", 
    "left-down", 
    "left",  
    "left-up"
  ]
  
  tiles_array.each_index do |idx|
    return idx if tiles_array[idx] == direction
  end  
end



def constant_dance(direction)
  hash = { 
    "up" => 0, 
    "right-up" => 1, 
    "right" => 2, 
    "right-down" => 3, 
    "down" => 4, 
    "left-down" => 5, 
    "left" => 6,  
    "left-up" => 7 
  }
  
  hash[direction]
end