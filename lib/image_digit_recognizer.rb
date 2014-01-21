class ImageDigitRecognizer

  def process_character(data)
    number = DigitData.index(data)
    unless number == nil
      number
    else
      '?'
    end
  end

  DigitData = [
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
      " | ",
      " | ",
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

end
