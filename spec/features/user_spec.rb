require 'spec_helper'

feature 'User Account' do
  scenario "user logs in" do
    visit('/')
    click_link('login')
    fill_in('user_email', with: 'admin@example.com')
    fill_in('user_password', with: 'password')
    expect(page).to have_content('You are logged in as admin@example.com')
  end

  scenario "user signs up" do
    visit('/')
    click_link('Sign up')
    fill_in('user_email', with: 'admin@example.com')
    fill_in('user_password', with: 'password')
    fill_in('user_password_confirmation', with: 'password')
    expect(page).to have_content('You are logged in as admin@example.com')
  end

  scenario "user logs out" do
    visit('/')
    click_link('login')
    fill_in('user_email', with: 'admin@example.com')
    fill_in('user_password', with: 'password')
    click_link('Sign in')
    expect(page).to have_content('Please log in.')
  end
end
