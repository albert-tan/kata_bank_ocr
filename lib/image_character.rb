class ImageCharacter

  def self.Top; 0 end
  def self.TopLeft; 1 end
  def self.TopRight; 2 end
  def self.Center; 3 end
  def self.BottomLeft; 4 end
  def self.BottomRight; 5 end
  def self.Bottom; 6 end
  def self.MaxSegments; 7 end

  def set_image(data)
    @segments = 0
    @segments |= (1 << ImageCharacter.Top) if data[0][1] == '_'
    @segments |= (1 << ImageCharacter.TopLeft) if data[1][0] == '|'
    @segments |= (1 << ImageCharacter.TopRight) if data[1][2] == '|'
    @segments |= (1 << ImageCharacter.Center) if data[1][1] == '_'
    @segments |= (1 << ImageCharacter.BottomLeft) if data[2][0] == '|'
    @segments |= (1 << ImageCharacter.BottomRight) if data[2][2] == '|'
    @segments |= (1 << ImageCharacter.Bottom) if data[2][1] == '_'
  end

  def [](segment)
    (@segments & (1 << segment)) != 0
  end

  def []=(segment, value)
    mask = 1 << segment
    if value
      @segments |= mask
    else
      @segments &= ~mask
    end
  end

  def ==(lhs)
    segments == lhs.segments
  end

  def value
    @@segments_to_value_lut[@segments]
  end

  def to_s
    value.to_s
  end

  def to_i
    value.to_i
  end

  protected

  attr_reader :segments

  @@segments_to_value_lut = {
    0b1110111 => '0',
    0b0100100 => '1',
    0b1011101 => '2',
    0b1101101 => '3',
    0b0101110 => '4',
    0b1101011 => '5',
    0b1111011 => '6',
    0b0100101 => '7',
    0b1111111 => '8',
    0b1101111 => '9'
  }

end

