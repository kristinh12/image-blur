class Image

  def initialize(array)
    @array = array
  end

  def output_image
    @array.each {|row| puts row.join}
  end

  def blur(distance)
    blur = Array.new(@array.length) {Array.new(@array[0].length, 0)}
    @array.each.with_index do |row, j|
      row.each.with_index do |pixel, i|
        if pixel == 1
          x = 0
          y = 0
          while x <= distance
            while y <= distance
              blur[j][i+x] = 1 unless (i + x >= row.length - 1 || x+y > distance)
              blur[j][i-x] = 1 unless (i - x <= 0 || x+y > distance)
              blur[j-y][i] = 1 unless (j - y <= 0 || x+y > distance)
              blur[j+y][i] = 1 unless (j + y >= @array.length - 1 || x+y > distance)
              y += 1
            end
            x += 1
          end  
        end
      end
    end
    Image.new(blur)
  end

end


image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image
image.blur(1).output_image
