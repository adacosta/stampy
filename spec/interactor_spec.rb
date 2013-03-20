require_relative 'spec_helper'

describe Interactor do
  let(:valid_input) { 8 }

  context "#initialize" do
    let(:input) { valid_input }

    subject { Interactor.new(input) }

    it { has_fives_and_threes_strategy_as_default }
    it { has_stamp_presenter_as_default }

    private

    def has_fives_and_threes_strategy_as_default
      subject.strategy.should be FivesAndThreesStrategy
    end

    def has_stamp_presenter_as_default
      subject.presenter.should be StampPresenter
    end
  end

  context "#calculate_and_humanize_input" do
    context "when input is valid for FivesAndThreesStrategy and StampPresenter" do
      let(:input) { valid_input }

      subject { Interactor.new(input, FivesAndThreesStrategy, StampPresenter).calculate_and_humanize_input }

      it { has_one_five_cent_stamp_and_one_three_cent_stamp }

      private

      def has_one_five_cent_stamp_and_one_three_cent_stamp
        subject.should == '1 five cent stamp, 1 three cent stamp'
      end
    end
  end
end