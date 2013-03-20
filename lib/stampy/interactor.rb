module Stampy
  class Interactor
    attr_reader :strategy, :presenter

    def initialize(input, strategy = Strategies::FivesAndThreesStrategy, presenter = Presenters::StampPresenter)
      @input = input
      @strategy = strategy
      @presenter = presenter
    end

    def calculate_and_humanize_input
      @presenter.new(strategy_calculation).
        humanize
    end

    private

    def strategy_calculation
      @strategy.new(@input).
        calculate
    end
  end
end