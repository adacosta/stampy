module Stampy
  module Strategies
    class FivesAndThreesStrategy
      def initialize(input)
        @threes = 0
        @fives = 0
        @input = input.to_i
        validate_input
      end

      def calculate
        case @input % 5
        when 0
          @fives = @input / 5
        when 2
          @fives = (@input / 5) - 2
          @threes = (@input - (@fives * 5)) / 3
        when 3
          @fives = @input / 5
          @threes = 1
        else
          @fives = (@input / 5) - 1
          @threes = (@input - (@fives * 5)) / 3
        end
        {'five' => @fives, 'three' => @threes}
      end

      private

      def validate_input
        raise(ArgumentError, "input must be >= 8") if @input < 8
      end
    end
  end
end