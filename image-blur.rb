class Image

  def initialize(array)
    @array = array
  end

  def output_image
    @array.each {|row| puts row.join}
  end

  def blur
    blur = Array.new(@array.length) {Array.new(@array[0].length, 0)}
    @array.each.with_index do |row, j|
      row.each.with_index do |pixel, i|
        if pixel == 1
          blur[j][i+1] = 1 unless i == row.length - 1
          blur[j][i-1] = 1 unless i == 0
          blur[j-1][i] = 1 unless j == 0
          blur[j+1][i] = 1 unless j == @array.length - 1
          blur[j][i] = 1
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
image.blur.output_image
