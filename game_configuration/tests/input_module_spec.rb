
require_relative '../../tests/tdd_classes'
require_relative '../input_module'

class DummyClass

  include InputModule

  def input_something
    receive
  end

end

RSpec.describe InputModule do

  let(:dummy_class) { DummyClass.new }

  #it "should let declare another input manager & receive any input" do
  #  fake_input = FakeInput.new
  #  dummy_class.init_input(fake_input)

  #  fake_input.this_one("A")
  #  something = dummy_class.input_something
  #  expect(something).to eq ("A")
  #end

end