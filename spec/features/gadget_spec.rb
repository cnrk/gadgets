require 'spec_helper'

feature 'Gadget Management' do
  let(:user) { create(:user) }
  let(:other_user) { create(:user, email: 'admin2@example.com') }

  before do
    create(:gadget, name: 'gadget1', user: user)
    create(:gadget, name: 'gadget2', user: user)
    create(:gadget, name: 'other gadget', user: other_user)
  end

  context 'user is signed in' do

    before do
      sign_in(user)
    end

    scenario 'user browses list of own gadgets' do
      expect(page).to have_content('gadget1')
      expect(page).to have_content('gadget2')
    end

    scenario 'user cannot see gadgets of other users' do
      expect(page).not_to have_content('other gadget')
    end

    scenario 'user adds a gadget' do
      click_link('Add a new Gadget')
      fill_in('Name', with: 'my new gadget')
      fill_in('Description', with: 'my new gadget description')
      click_button('Submit')
    end

  end

  context 'user is not signed in' do

    scenario 'user is not allowed to browse gadgets' do
      visit(gadgets_path)
      expect(current_path).to eq(root_path)
      expect(page).to have_content('Please log in.')
    end

  end
end
