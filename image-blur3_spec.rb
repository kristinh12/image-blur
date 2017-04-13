require_relative 'image-blur3'

describe "blur distance of 1" do
  it "returns an array with adjacent pixels in center blurred" do
    input = Image.new([
      [0, 0, 0],
      [0, 1, 0],
      [0, 0, 0]
    ])
    output = Image.new([
      [0, 1, 0],
      [1, 1, 1],
      [0, 1, 0]
      ])
    
    expect(input.blur(1)).to eq(output)
  end

  it "returns an array with pixels by top right corner blurred" do
    input = Image.new([
      [0, 0, 1],
      [0, 0, 0],
      [0, 0, 0]
      ])
    output = Image.new([
      [0, 1, 1],
      [0, 0, 1],
      [0, 0, 0]
      ])

    expect(input.blur(1)).to eq(output)
  end

  it "returns an array with pixels by bottom left corner blurred" do
    input = Image.new([
      [0, 0, 0],
      [0, 0, 0],
      [1, 0, 0]
      ])
    output = Image.new([
      [0, 0, 0],
      [1, 0, 0],
      [1, 1, 0]
      ])

    expect(input.blur(1)).to eq(output)
  end
end

describe "blur distances more than 1" do
  it "returns an array with pixels blurred by 2 in center" do
    input = Image.new([
      [0, 0, 0, 0],
      [0, 0, 1, 0],
      [0, 0, 0, 0]
      ])
    output = Image.new([
      [0, 1, 1, 1],
      [1, 1, 1, 1],
      [0, 1, 1, 1]
      ])

    expect(input.blur(2)).to eq(output)
  end

  it "returns an array with pixels blurred by 3 in center" do
    input = Image.new([
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0]
      ])
    output = Image.new([
      [0, 1, 1, 1, 0],
      [1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1],
      [0, 1, 1, 1, 0]
      ])
    
    expect(input.blur(3)).to eq(output)
  end
end