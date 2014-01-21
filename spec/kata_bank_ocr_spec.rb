require "kata_bank_ocr"

describe KataBankOCR do

  it "parses image containing 3 lines of following numbers => 457508000, 664371495, 86110??36" do
    result_arr = subject.process_image(SampleImageData)
    result_arr.length.should == 3
    result_arr[0].should == "457508000"
    result_arr[1].should == "664371495 ERR"
    result_arr[2].should == "86110??36 ILL"
  end

  SampleImageData = [
    "    _  _  _  _  _  _  _  _ ",
    "|_||_   ||_ | ||_|| || || |",
    "  | _|  | _||_||_||_||_||_|",
    "                           ",
    " _  _     _  _        _  _ ",
    "|_ |_ |_| _|  |  ||_||_||_ ",
    "|_||_|  | _|  |  |  | _| _|",
    "                           ",
    " _  _        _     _  _  _ ",
    "|_||_   |  || ||    | _||_ ",
    "|_||_|  |  ||_|| ||_| _||_|",
    "                           "
  ]

end
