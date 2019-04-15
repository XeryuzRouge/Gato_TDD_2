require_relative '../../tests/tdd_classes'
require_relative '../output_module'

class DummyClass

  include OutputModule

  def output_anything
    show "anything"
  end

end

RSpec.describe OutputModule do

  let(:dummy_class) { DummyClass.new }

  it "should show anything" do
    fake_output = FakeOutput.new
    dummy_class.init_output(fake_output)
    dummy_class.output_anything
    expect(fake_output.message).to eq ("anything")
  end

  it "should write anything" do
    fake_output = FakeOutput.new
    dummy_class.init_output(fake_output)
    dummy_class.output_anything
    expect(fake_output.message).to eq ("anything")
  end

end