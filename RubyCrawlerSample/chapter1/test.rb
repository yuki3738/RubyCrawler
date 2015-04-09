def area(x, y) x*y end
class Rect
	def initialize(x, y) @x, @y = x, y end
	attr_reader :x, :y

	# 引数がメソッド化！
	def area() x*y end
end
area(10,5)      	# => 50
Rect.new(10,5).area	# => 50