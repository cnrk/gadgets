require 'spec_helper'

feature 'Gadget Manager' do
  before do
    # login
    visit('/')
    click_link('login')
    fill_in('user_email', with: 'admin@example.com')
    fill_in('user_password', with: 'password')
  end

  scenario "user browses list of gadgets" do
    pending
    visit('/')
    expect(page).to have_selector('h3', text: 'Gadget 1')
  end

  scenario "user browses cover flow of gadgets" do
    pending
    visit('/')
  end

  scenario "user clicks a gadget to see detail page" do
    pending
    visit('/')
    click_link('details')
    expect(page).to have_selector('h3', text: 'Gadget 1')
  end

  scenario "user adds a gadget" do
    pending
    visit('/')
    click_link('add gadget')
  end

  scenario "user adds an image to a gadget" do
    pending
  end

end
