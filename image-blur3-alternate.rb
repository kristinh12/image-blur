class Image

  attr_reader :array
  def initialize(array)
    @array = array
  end

  def output_image
    @array.each {|row| puts row.join}
  end

  def blur(distance)
    # Creates a new two-dimensional array that is the same dimensions as @array where each element is a 0.
    blur = Array.new(@array.length) {Array.new(@array[0].length, 0)}

    
      # Changes each element adjacent to a 1 to also be 1.
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
    
      # If the image needs to be blurred by more than 1 unit, 
      # this will continue to use the method blur until all elements within the given distance are a 1.
     if distance > 1
       Image.new(blur).blur(distance-1)
     else
       Image.new(blur)
     end
  end

  def ==(other_image)
    @array == other_image.array
  end

end
