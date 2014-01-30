require 'spec_helper'

feature 'User Account' do
  scenario "user logs in" do
    pending
    visit('/')
    click_link('login')
    fill_in('user_email', with: 'admin@example.com')
    fill_in('user_password', with: 'password')
    click_button('Sign in')
    expect(page).to have_content('logout')
  end

  scenario "user signs up" do
    pending
    visit('/')
    click_link('sign up')
    fill_in('user_email', with: 'admin@example.com')
    fill_in('user_password', with: 'password')
    fill_in('user_password_confirmation', with: 'password')
    expect(page).to have_content('logout')
  end

  scenario "user logs out" do
    pending
    visit('/')
    click_link('login')
    fill_in('user_email', with: 'admin@example.com')
    fill_in('user_password', with: 'password')
    click_button('Sign in')
    expect(page).to have_content('login')
  end
end
