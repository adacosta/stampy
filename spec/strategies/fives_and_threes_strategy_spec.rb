require_relative '../spec_helper'

describe FivesAndThreesStrategy do
  let(:strategy_class) { FivesAndThreesStrategy }

  context "#calculate" do
    subject { combination_of_fives_and_threes_for_input(input) }

    context "when input is 8" do
      let(:input) { 8 }

      it { has_one_5_and_one_3 }
    end

    context "when input is 9" do
      let(:input) { 9 }

      it { has_no_5s_and_three_3s }
    end

    context "when input is 10" do
      let(:input) { 10 }

      it { has_two_5s_and_no_3s }
    end

    context "when input is 11" do
      let(:input) { 11 }

      it { has_one_5_and_two_3s }
    end

    context "when input is 12" do
      let(:input) { 12 }

      it { has_no_5s_and_four_3s }
    end

    context "when input is 13" do
      let(:input) { 13 }

      it { has_two_5s_and_one_3 }
    end

    context "when input is 14" do
      let(:input) { 14 }

      it { has_one_5_and_three_3s }
    end

    context "when input is 15" do
      let(:input) { 15 }

      it { has_three_5s_and_no_threes }
    end

    context "when input is 16" do
      let(:input) { 16 }

      it { has_two_5s_and_two_3s }
    end

    context "when input is 17" do
      let(:input) { 17 }

      it { has_one_5_and_four_3s }
    end

    context "when input varies from 18 to 117" do
      let(:inputs) { 18..117 }

      it { has_a_sum_of_5s_and_3s_which_equal_input }
    end

    private

    def combination_of_fives_and_threes_for_input(input)
      strategy_class.new(input).
        calculate
    end

    def has_one_5_and_one_3
      subject.should == {'five' => 1, 'three' => 1}
    end

    def has_no_5s_and_three_3s
      subject.should == {'five' => 0, 'three' => 3}
    end

    def has_two_5s_and_no_3s
      subject.should == {'five' => 2, 'three' => 0}
    end

    def has_one_5_and_two_3s
      subject.should == {'five' => 1, 'three' => 2}
    end

    def has_no_5s_and_four_3s
      subject.should == {'five' => 0, 'three' => 4}
    end

    def has_two_5s_and_one_3
      subject.should == {'five' => 2, 'three' => 1}
    end

    def has_one_5_and_three_3s
      subject.should == {'five' => 1, 'three' => 3}
    end

    def has_three_5s_and_no_threes
      subject.should == {'five' => 3, 'three' => 0}
    end

    def has_two_5s_and_two_3s
      subject.should == {'five' => 2, 'three' => 2}
    end

    def has_one_5_and_four_3s
      subject.should == {'five' => 1, 'three' => 4}
    end

    def has_a_sum_of_5s_and_3s_which_equal_input
      inputs.each do |input|
        combination_of_fives_and_threes = combination_of_fives_and_threes_for_input(input)
        combination_sum = (5 * combination_of_fives_and_threes['five']) + (3 * combination_of_fives_and_threes['three'])
        combination_sum.should == input
      end
    end
  end
end