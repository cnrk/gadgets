require 'spec_helper'

feature 'User Account' do
  scenario "user logs in" do
    visit('/')
    click_link('login')
    fill_in('email', with: 'admin@example.com')
    fill_in('password', with: 'password')
    expect(page).to have_conent('You are logged in: admin@example.com')
  end

  scenario "user signs up" do
    visit('/')
    click_link('login')
    fill_in('email', with: 'admin@example.com')
    fill_in('password', with: 'password')
    fill_in('password_confirmation', with: 'password')
    expect(page).to have_conent('You are logged in: admin@example.com')
  end

  scenario "user logs out" do
    visit('/')
    click_link('login')
    fill_in('email', with: 'admin@example.com')
    fill_in('password', with: 'password')
    click_link('logout')
    expect(page).to have_conent('Please log in.')

  end
end
