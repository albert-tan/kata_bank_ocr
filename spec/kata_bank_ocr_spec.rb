require "kata_bank_ocr"

describe KataBankOCR do

  it "parses image containing 3 line of following numbers => 123456789, 098765432, 135792468" do
    result_arr = subject.process_image(SampleImageData)
    result_arr.length.should == 3
    result_arr[0].should == "123456789"
    result_arr[1].should == "098765432"
    result_arr[2].should == "135792468"
  end

  SampleImageData = [
    "    _  _     _  _  _  _  _ ",
    " |  _| _||_||_ |_   ||_||_|",
    " | |_  _|  | _||_|  ||_| _|",
    "                           ",
    " _  _  _  _  _  _     _  _ ",
    "| ||_||_|  ||_ |_ |_| _| _|",
    "|_| _||_|  ||_| _|  | _||_ ",
    "                           ",
    "    _  _  _  _  _     _  _ ",
    " |  _||_   ||_| _||_||_ |_|",
    " |  _| _|  | _||_   ||_||_|",
    "                           "
  ]

end
