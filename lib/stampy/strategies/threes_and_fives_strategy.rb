class ThreesAndFivesStrategy
  def initialize(input)
    @threes = 0
    @fives = 0
    @input = input
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

  def fives_remainder
    @input % 5
  end

  def fives_sum
    @fives * 5
  end
end