require "image_line_splitter"
require "image_character_tokenizer"
require "image_digit_recognizer"

class KataBankOCR

  def process_image(data)
    img_line_splitter = ImageLineSplitter.new
    img_character_tokenizer = ImageCharacterTokenizer.new
    img_digit_recognizer = ImageDigitRecognizer.new
    result_arr = []

    img_line_arr = img_line_splitter.split_lines(data)
    img_line_arr.each do |img_line|
      line_result = ""
      img_character_arr = img_character_tokenizer.tokenize(img_line)
      img_character_arr.each do |img_character|
        line_result += img_digit_recognizer.process_character(img_character).to_s
      end
      result_arr << line_result
    end

    result_arr
  end

end
