require "image_character_tokenizer"

describe ImageCharacterTokenizer do

  it "breaks an image of a series of numbers into an array with elements consist of individual number image" do
    digit_data_arr = subject.tokenize(SampleImageData)
    digit_data_arr.length.should == 9
    digit_data_arr.each do |digit_data|
      digit_data.length.should == 4
      digit_data.each do |sub_line|
        sub_line.length.should == 3
      end
    end
  end

  SampleImageData = [
    "    _  _     _  _  _  _  _ ",
    " |  _| _||_||_ |_   ||_||_|",
    " | |_  _|  | _||_|  ||_| _|",
    "                           "
  ]

end
