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

    # Iterates through each element of array. 
    # If there is a 1, all elements within the given distance will be changed to equal 1.
    @array.each.with_index do |row, j|
      row.each.with_index do |pixel, i|
        if pixel == 1
          for x in 0..distance
            for y in 0..distance
              if x+y <= distance
                blur[j-y][i+x] = 1 unless (i + x > row.length - 1 || j-y < 0)
                blur[j+y][i+x] = 1 unless (i + x > row.length - 1 || j+y > @array.length - 1)
                blur[j-y][i-x] = 1 unless (i - x < 0 || j-y < 0)
                blur[j+y][i-x] = 1 unless (i - x < 0 || j+y > @array.length - 1)
              end
            end
          end  

        end
      end
    end

    Image.new(blur)
  end

  def ==(other_image)
    @array == other_image.array
  end

end
