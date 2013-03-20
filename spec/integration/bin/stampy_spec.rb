require_relative '../../spec_helper'
require 'stringio'

describe "bin/stampy" do
  let(:bin_stampy_path) { File.join(File.dirname(__FILE__), '..', '..', '..', 'bin') }
  let(:ruby_command) { 'ruby' }

  subject { bin_stampy_output }

  context "when executing with valid input" do
    let(:valid_input) { 8 }
    let(:input) { valid_input }
    let(:expected_output) { "1 five cent stamp, 1 three cent stamp\n" }

    it { executes_with_valid_input_and_has_valid_output }

    context "when executing with several valid inputs" do
      let(:valid_input_alternate) { 12 }
      let(:input) { "#{valid_input}, #{valid_input_alternate}" }

      it { executes_using_the_first_input }
    end

    private

    def executes_with_valid_input_and_has_valid_output
      subject.should == expected_output
    end

    def executes_with_the_first_input
      executes_with_valid_input_and_has_valid_output
    end
  end

  context "when executing with invalid input" do
    context "when input is an invalid integer" do
      let(:input) { 7 }

      it { outputs_argument_error_to_stderr_with_ruby_stack_trace }
    end

    context "when input is not present" do
      let(:input) { nil }

      it { outputs_argument_error_to_stderr_with_ruby_stack_trace }
    end

    private

    def outputs_argument_error_to_stderr_with_ruby_stack_trace
      subject.should include "input must be >= 8 (ArgumentError)"
    end
  end

  private

  def bin_stampy_output
    Dir.chdir(bin_stampy_path) { %x[#{ruby_command} stampy.rb #{input} #{redirect_stderr_to_stdout}] }
  end

  def redirect_stderr_to_stdout
    "2>&1"
  end
end