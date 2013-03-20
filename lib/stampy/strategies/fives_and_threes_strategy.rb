class FivesAndThreesStrategy
  def initialize(input)
    @threes = 0
    @fives = 0
    @input = input.to_i
    validate_input
  end

  def calculate
    if fives_remainder == 0
      @fives = @input / 5
    elsif fives_remainder == 2
      @fives = (@input / 5) - 2
      @threes = (@input - fives_sum) / 3
    elsif fives_remainder == 3
      @fives = @input / 5
      @threes = 1
    else
      @fives = (@input / 5) - 1
      @threes = (@input - fives_sum) / 3
    end
    {'five' => @fives, 'three' => @threes}
  end

  private

  def validate_input
    raise(ArgumentError, "input must be >= 8") if @input < 8
  end

  def fives_remainder
    @input % 5
  end

  def fives_sum
    @fives * 5
  end
end