require "image_line_splitter"

describe ImageLineSplitter do

  it "split multiple image lines into an array with elements consist of individual line image" do
    line_data_arr = subject.split_lines(SampleImageData)
    line_data_arr.length.should == 3
    line_data_arr.each do |line_data|
      line_data.length.should == 4
      line_data.each do |sub_line|
        sub_line.length.should == 27
      end
    end
    line_data_arr[1].should == SampleImageData[4,4]
  end

  SampleImageData = [
    "    _  _     _  _  _  _  _ ",
    " |  _| _||_||_ |_   ||_||_|",
    " | |_  _|  | _||_|  ||_| _|",
    "                           ",
    "    _  _     _  _  _  _  _ ",
    " |  _| _||_||_ |_   ||_||_|",
    " | |_  _|  | _||_|  ||_| _|",
    "                           ",
    "    _  _     _  _  _  _  _ ",
    " |  _| _||_||_ |_   ||_||_|",
    " | |_  _|  | _||_|  ||_| _|",
    "                           "
  ]

end

