require 'spec_helper'

feature 'User Account' do
  let(:user){ create(:user) }

  scenario "user signs up with correct credentials" do
    visit('/')
    click_link('sign up')
    fill_in('user_email', with: 'admin2@example.com')
    fill_in('user_password', with: 'admin2admin2')
    fill_in('user_password_confirmation', with: 'admin2admin2')
    click_button('Sign up')
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario "user signs up with incorrect credentials" do
    visit('/')
    click_link('sign up')
    fill_in('user_email', with: 'admin2@example.com')
    fill_in('user_password', with: 'admin2admin2')
    fill_in('user_password_confirmation', with: 'wrongpassword')
    click_button('Sign up')
    expect(page).to have_content("Password confirmation doesn't match Password")
    expect(page).to have_content('login')
  end

  scenario "user logs in with correct credentials" do
    visit('/')
    click_link('login')
    fill_in('user_email', with: user.email)
    fill_in('user_password', with: user.password)
    click_button('Sign in')
    expect(page).to have_content('Signed in successfully.')
    expect(page).to have_content('logout')
  end

  scenario "user logs in with incorrect credentials" do
    visit('/')
    click_link('login')
    fill_in('user_email', with: user.email)
    fill_in('user_password', with: 'wrongpassword')
    click_button('Sign in')
    expect(page).to have_content('Invalid email or password.')
    expect(page).to have_content('login')
  end

  context "user is logged in" do
    before do
      sign_in(user)
    end

    scenario "user logs out" do
      click_link('logout')
      expect(page).to have_content('login')
    end
  end
end
