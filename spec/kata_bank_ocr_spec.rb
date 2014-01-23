require "kata_bank_ocr"

describe KataBankOCR do

  it "process image data and verify returned output is correct" do
    result_arr = subject.process_image(SampleImageData)
    result_arr.length.should == 9
    result_arr[0].should == "457508000"
    result_arr[1].should == "922222223"
    result_arr[2].should == "711111111"
    result_arr[3].should == "711111111"
    result_arr[4].should == "11111111? ILL"
    result_arr[5].should == "?1111111? ILL"
    result_arr[6].should == "222222222 ERR"
    result_arr[7].should == "222222229 ERR"
    result_arr[8].should == "888888888 AMB"
  end

  SampleImageData = [
    #
    "    _  _  _  _  _  _  _  _ ",
    "|_||_   ||_ | ||_|| || || |",
    "  | _|  | _||_||_||_||_||_|",
    "                           ",
    #
    " _  _  _  _  _  _  _  _  _ ",
    "|_| _| _| _| _| _| _| _||_|",
    " _||_ |_ |_ |_ |_ |_ |_  _|",
    "                           ",
    #
    "                           ",
    "  |  |  |  |  |  |  |  |  |",
    "  |  |  |  |  |  |  |  |  |",
    "                           ",
    #
    " _                         ",
    "  |  |  |  |  |  |  |  |  |",
    "  |  |  |  |  |  |  |  | _|",
    "                           ",
    #
    "                           ",
    "  |  |  |  |  |  |  |  |  |",
    "  |  |  |  |  |  |  |  | _|",
    "                           ",
    #
    "                           ",
    " _|  |  |  |  |  |  |  |  |",
    "  |  |  |  |  |  |  |  | _|",
    "                           ",
    #
    " _  _  _  _  _  _  _  _  _ ",
    " _| _| _| _| _| _| _| _| _|",
    "|_ |_ |_ |_ |_ |_ |_ |_ |_ ",
    "                           ",
    #
    " _  _  _  _  _  _  _  _  _ ",
    " _| _| _| _| _| _| _| _||_|",
    "|_ |_ |_ |_ |_ |_ |_ |_  _|",
    "                           ",
    #
    " _  _  _  _  _  _  _  _  _ ",
    "|_||_||_||_||_||_||_||_||_|",
    "|_||_||_||_||_||_||_||_||_|",
    "                           ",
  ]

end
