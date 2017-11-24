require 'pry'

class Triangle

  attr_accessor :sides

  def initialize(side_a, side_b, side_c)
    @sides = [side_a, side_b, side_c]
  end

  def kind
    if !valid?
      raise TriangleError
    elsif sides.uniq.length == 1
      :equilateral
    elsif sides.uniq.length == 2
      :isosceles
    elsif sides.uniq.length == 3
      :scalene
    end
  end

  def valid?
    length = sides.all? {|side| side > 0}
    side_sum = sides.inject(0){|sum,x| sum + x }
    size = sides.all? {|side| side < side_sum - side}
    length && size
  end

end



class TriangleError < StandardError
 # triangle error code
end
