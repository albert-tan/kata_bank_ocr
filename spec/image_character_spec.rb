require "image_character"

describe ImageCharacter do

  it "analyse a digit image data and tell which digit segment is turn on and which is turn off." do
    sampleImageData = [
      "   ",
      "   ",
      "   ",
      "   "
    ]
    subject.set_image(sampleImageData)
    subject[ImageCharacter.Top].should be_false
    subject[ImageCharacter.TopLeft].should be_false
    subject[ImageCharacter.TopRight].should be_false
    subject[ImageCharacter.Center].should be_false
    subject[ImageCharacter.BottomLeft].should be_false
    subject[ImageCharacter.BottomRight].should be_false
    subject[ImageCharacter.Bottom].should be_false
    
    sampleImageData = [
      " _ ",
      "|_|",
      "|_|",
      "   "
    ]
    subject.set_image(sampleImageData)
    subject[ImageCharacter.Top].should be_true
    subject[ImageCharacter.TopLeft].should be_true
    subject[ImageCharacter.TopRight].should be_true
    subject[ImageCharacter.Center].should be_true
    subject[ImageCharacter.BottomLeft].should be_true
    subject[ImageCharacter.BottomRight].should be_true
    subject[ImageCharacter.Bottom].should be_true
    
    sampleImageData = [
      " _ ",
      " _|",
      "|_ ",
      "   "
    ]
    subject.set_image(sampleImageData)
    subject[ImageCharacter.Top].should be_true
    subject[ImageCharacter.TopLeft].should be_false
    subject[ImageCharacter.TopRight].should be_true
    subject[ImageCharacter.Center].should be_true
    subject[ImageCharacter.BottomLeft].should be_true
    subject[ImageCharacter.BottomRight].should be_false
    subject[ImageCharacter.Bottom].should be_true
  end

  it "returns the character value the image data correspond to" do
    subject.set_image([
      " _ ",
      "| |",
      "|_|",
      "   "
    ])
    subject.value.should == '0'

    subject.set_image([
      "   ",
      "  |",
      "  |",
      "   "
    ])
    subject.value.should == '1'

    subject.set_image([
      " _ ",
      " _|",
      "|_ ",
      "   "
    ])
    subject.value.should == '2'

    subject.set_image([
      " _ ",
      " _|",
      " _|",
      "   "
    ])
    subject.value.should == '3'

    subject.set_image([
      "   ",
      "|_|",
      "  |",
      "   "
    ])
    subject.value.should == '4'

    subject.set_image([
      " _ ",
      "|_ ",
      " _|",
      "   "
    ])
    subject.value.should == '5'

    subject.set_image([
      " _ ",
      "|_ ",
      "|_|",
      "   "
    ])
    subject.value.should == '6'

    subject.set_image([
      " _ ",
      "  |",
      "  |",
      "   "
    ])
    subject.value.should == '7'

    subject.set_image([
      " _ ",
      "|_|",
      "|_|",
      "   "
    ])
    subject.value.should == '8'

    subject.set_image([
      " _ ",
      "|_|",
      " _|",
      "   "
    ])
    subject.value.should == '9'

    subject.set_image([
      "   ",
      "  ",
      "   ",
      "   "
    ])
    subject.value.should be_nil

    subject.set_image([
      "   ",
      "   ",
      "   "
    ])
    subject.value.should be_nil

    subject.set_image([
      "   ",
      "   ",
      "   ",
      "   "
    ])
    subject.value.should be_nil

    subject.set_image([
      " _ ",
      "  |",
      " _|",
      "   "
    ])
    subject.value.should be_nil

    subject.set_image([
      " _ ",
      "|  ",
      "|_ ",
      "   "
    ])
    subject.value.should be_nil

    subject.set_image([
      " _ ",
      "| |",
      "| |",
      "   "
    ])
    subject.value.should be_nil

    subject.set_image([
      "   ",
      "| |",
      "|_|",
      "   "
    ])
    subject.value.should be_nil
  end

end

