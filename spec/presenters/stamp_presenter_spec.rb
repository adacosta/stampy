require_relative '../spec_helper'

describe Stampy::Presenters::StampPresenter do
  let(:stamp_presenter_class) { Stampy::Presenters::StampPresenter }

  context "#humanize" do
    subject { stamp_presenter_for_stamps(stamps).humanize }

    context "with no five cent stamps" do
      let(:stamps) { {'five' => 0} }

      it { has_no_five_cent_stamps }
    end

    context "with one five cent stamp" do
      let(:stamps) { {'five' => 1} }

      it { has_one_five_cent_stamp }
    end

    context "with two five cent stamps" do
      let(:stamps) { {'five' => 2} }

      it { has_two_five_cent_stamps }
    end

    context "with no five cent stamps and one three cent stamp" do
      let(:stamps) { {'five' => 0, 'three' => 1} }

      it { has_no_five_cent_stamps_and_one_three_cent_stamp }
    end

    context "with one five cent stamp and two three cent stamps" do
      let(:stamps) { {'five' => 1, 'three' => 2} }

      it { has_one_five_cent_stamp_and_two_three_cent_stamps }
    end

    private

    def stamp_presenter_for_stamps(stamps)
      stamp_presenter_class.new(stamps)
    end

    def has_no_five_cent_stamps
      subject.should == '0 five cent stamps'
    end

    def has_one_five_cent_stamp
      subject.should == '1 five cent stamp'
    end

    def has_two_five_cent_stamps
      subject.should == '2 five cent stamps'
    end

    def has_no_five_cent_stamps_and_one_three_cent_stamp
      subject.should == '0 five cent stamps, 1 three cent stamp'
    end

    def has_one_five_cent_stamp_and_two_three_cent_stamps
      subject.should == '1 five cent stamp, 2 three cent stamps'
    end
  end
end