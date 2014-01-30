require 'spec_helper'

describe Gadget do
  let(:gadget){ FactoryGirl.build(:gadget) }

  it "should be a valid" do
    pending 'factory girl not properly initialized'
    expect(gadget).to be_valid
  end

  it "requires a name" do
    pending 'factory girl not properly initialized'
    gadget.name = nil
    expect(gadget).not_to be_valid
  end
end
