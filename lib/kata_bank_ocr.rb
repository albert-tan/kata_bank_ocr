require "image_line_splitter"
require "image_character"
require "image_character_tokenizer"
require "image_digit_recognizer"
require "account_validator"

class KataBankOCR

  def initialize
    @img_line_splitter = ImageLineSplitter.new
    @img_character_tokenizer = ImageCharacterTokenizer.new
    @img_digit_recognizer = ImageDigitRecognizer.new
    @account_validator = AccountValidator.new
  end

  def process_image(raw_img_data)
    result_arr = []

    @img_line_splitter.split_lines(raw_img_data).each do |raw_img_line|
      img_character_arr = @img_character_tokenizer.tokenize(raw_img_line).map do |raw_img_character|
        img_character = ImageCharacter.new
        img_character.set_image(raw_img_character)
        img_character
      end
      result_arr << process_line(img_character_arr)
    end

    result_arr
  end

  private

  def process_line(img_character_arr)
    # get account number and fill illegal image character list if illegal characters was found
    ill_img_character_arr = []
    result = get_account_number(img_character_arr, ill_img_character_arr: ill_img_character_arr )

    # return illegal result if more than 1 illegal characters was found
    return result + " ILL" if ill_img_character_arr.length > 1

    # only has 1 illegal characters
    if ill_img_character_arr.length == 1
      # get a list of all possible results
      possible_results = get_other_combinations(img_character_arr, ill_img_character_arr[0])
      # return illegal result if yielding no other possible result
      return result + " ILL" if possible_results.length <= 0
      # return ambiguous result if yielding more than 1 possible results
      return result + " AMB" if possible_results.length > 1
      # else return the only one result
      return possible_results[0]
    end

    # at this stage, it basically means there is no illegal character present
    # so proceed to validate checksum, if fails...
    unless @account_validator.validate_account_number(img_character_arr)
      # swap each digit with other possible digits and compare checksum
      possible_result = nil
      (0..img_character_arr.length - 1).each do |index|
        swappable_digits = @@swappable_char_lut[img_character_arr[index].value]
        if swappable_digits
          current_img_character = img_character_arr[index]
          # for each possible digit swapped...
          swappable_digits.each do |digit|
            img_character_arr[index] = digit
            # if yields valid account number...
            if @account_validator.validate_account_number(img_character_arr)
              # return ambiguous result if there is another possible result yielded in previous loop
              return result + " AMB" if possible_result
              # else save this possible result
              possible_result = get_account_number(img_character_arr)
            end
          end
          img_character_arr[index] = current_img_character
        end
      end
      # return error checksum result unless other possible result was found
      return result + " ERR" unless possible_result
      # return the only possible result
      return possible_result
    end

    # finally return the result if everything is okay
    return result
  end

  def get_other_combinations(img_character_arr, ill_img_character)
    result_arr = []
    (0..ImageCharacter.MaxSegments - 1).each do |segment|
      segment_state = ill_img_character[segment]
      ill_img_character[segment] = !segment_state
      if ill_img_character.value
        result_arr << get_account_number(img_character_arr) if @account_validator.validate_account_number(img_character_arr)
      end
      ill_img_character[segment] = segment_state
    end
    return result_arr
  end

  def get_account_number(img_character_arr, options={})
    ill_img_character_arr = options[:ill_img_character_arr]
    result = img_character_arr.map do |img_character|
      if img_character.to_s.empty?
        ill_img_character_arr << img_character if ill_img_character_arr
        '?'
      else
        img_character.to_s
      end
    end
    result.join
  end

  @@swappable_char_lut = {
    '0' => [8],
    '1' => [7],
    '3' => [9],
    '5' => [6,9],
    '6' => [5,8],
    '7' => [1],
    '8' => [0,6,9],
    '9' => [3,5,8]
  }

end
