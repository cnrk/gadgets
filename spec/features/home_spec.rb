require 'spec_helper'

feature 'Home Page' do
  scenario "user visits the home page" do
    visit('/')
    expect(page).to have_content('Welcome to Gadgets')
  end
end


