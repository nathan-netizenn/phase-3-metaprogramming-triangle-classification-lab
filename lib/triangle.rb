class Triangle
  # write code here
  attr_reader :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    validate_triangle
  end

  def kind
    if side1 == side2 && side2 == side3
      :equilateral
    elsif side1 == side2 || side2 == side3 || side1 == side3
      :isosceles
    else
      :scalene
    end
  end

  private

  def validate_triangle
    validate_positive_sides
    validate_triangle_inequality
  end

  def validate_positive_sides
    raise TriangleError, 'Sides must be greater than 0.' if side1 <= 0 || side2 <= 0 || side3 <= 0
  end

  def validate_triangle_inequality
    valid_triangle = (side1 + side2 > side3) && (side2 + side3 > side1) && (side1 + side3 > side2)
    raise TriangleError, 'Invalid triangle sides.' unless valid_triangle
  end

  class TriangleError < StandardError
  end
end