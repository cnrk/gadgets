module UserHelper
  def sign_in(user)
    visit('/')
    click_link('login')
    fill_in('user_email', with: user.email)
    fill_in('user_password', with: user.password)
    click_button('Sign in')
  end
end
