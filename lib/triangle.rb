class Triangle
  attr_accessor :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    if a == 0 || b == 0 || c == 0
      begin
        raise TriangleError
      rescue TriangleError => error
        error.messgage_no_size
      end
    elsif a < 0 || b < 0 || c < 0
      begin
        raise TriangleError
      rescue TriangleError => error
        error.messgage_negative
      end
    else
      if a+b > c && a+c > b && b+c > a
        if a == b && b == c
          :equilateral
        elsif a == b || b == c || a == c
          :isosceles
        else
          :scalene
        end
      else
        begin
          raise TriangleError
        rescue TriangleError => error
          puts error.messgage_inequality
        end
      end
    end
  end

  def triangle_size_check?
    [a, b, c].all > 0
  end


  class TriangleError < StandardError
    def messgage_no_size
      "Triangle#kind raises an error for triangles with no size"
    end
    def messgage_negative
      "Triangle#kind raises an error for triangles with negative sides"
    end
    def messgage_inequality
      "Triangle#kind raises an error for triangles violating triangle inequality"
    end
  end
end



puts Triangle.new(0, 0, 0).triangle_size_check?
puts Triangle.new(3, 4, -5).kind
puts Triangle.new(1, 1, 3).kind
