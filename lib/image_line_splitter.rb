class ImageLineSplitter
  private 
  LINE_HEIGHT = 4

  public
  def split_lines(data)
    line_data_arr = []
    total_sub_lines = data.length
    sub_line_position = 0
    while sub_line_position < total_sub_lines
      line_data_arr << data[sub_line_position, LINE_HEIGHT]
      sub_line_position += LINE_HEIGHT
    end
    line_data_arr
  end

end
