require 'spec_helper'

describe Gadget do
  let(:gadget){ build(:gadget) }

  it "should be a valid" do
    expect(gadget).to be_valid
  end

  it "requires a name" do
    gadget.name = nil
    expect(gadget).not_to be_valid
  end
end
