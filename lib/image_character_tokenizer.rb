class ImageCharacterTokenizer

  def tokenize(data)
    digit_data_arr = []
    image_length = data[0].length
    x_position = 0
    while x_position < image_length
      digit_data = []
      data.each do |sub_line|
        digit_data << sub_line[x_position, 3]
      end
      digit_data_arr << digit_data
      x_position += 3
    end
    digit_data_arr
  end

end

