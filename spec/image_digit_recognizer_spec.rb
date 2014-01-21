require "image_digit_recognizer"

describe ImageDigitRecognizer do
  
  it "recognize digit image between 0 to 9 and returns corresponding integer number" do
    (0..9).each do |digit|
      subject.process_character(SampleDigitData[digit]).should == digit
    end
  end

  it "returns ? for illegible number" do
    SampleIllegibleNumbers.each do |sampleIllegibleNumber|
      subject.process_character(sampleIllegibleNumber).should == '?'
    end
  end

  SampleDigitData = [
    # 0
    [
      " _ ",
      "| |",
      "|_|",
      "   "
    ],
    # 1
    [
      "   ",
      "  |",
      "  |",
      "   "
    ],
    # 2
    [
      " _ ",
      " _|",
      "|_ ",
      "   "
    ],
    # 3
    [
      " _ ",
      " _|",
      " _|",
      "   "
    ],
    # 4
    [
      "   ",
      "|_|",
      "  |",
      "   "
    ],
    # 5
    [
      " _ ",
      "|_ ",
      " _|",
      "   "
    ],
    # 6
    [
      " _ ",
      "|_ ",
      "|_|",
      "   "
    ],
    # 7
    [
      " _ ",
      "  |",
      "  |",
      "   "
    ],
    # 8
    [
      " _ ",
      "|_|",
      "|_|",
      "   "
    ],
    # 9
    [
      " _ ",
      "|_|",
      " _|",
      "   "
    ]
  ]

  SampleIllegibleNumbers = [
    [
      "   ",
      "  ",
      "   ",
      "   "
    ],
    [
      "   ",
      "   ",
      "   "
    ],
    [
      "   ",
      "   ",
      "   ",
      "   "
    ],
    [
      " _ ",
      "  |",
      " _|",
      "   "
    ],
    [
      " _ ",
      "|  ",
      "|_ ",
      "   "
    ],
    [
      " _ ",
      "| |",
      "| |",
      "   "
    ],
    [
      "   ",
      "| |",
      "|_|",
      "   "
    ]
  ]

end
