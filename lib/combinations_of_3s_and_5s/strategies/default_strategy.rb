class DefaultStrategy
  def initialize(input)
    @threes = 0
    @fives = 0
    @input = input
  end

  def combination_of_3s_and_5s
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
    {'5' => @fives, '3' => @threes}
  end

  private

  def fives_remainder
    @input % 5
  end

  def fives_sum
    @fives * 5
  end
end