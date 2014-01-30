require 'spec_helper'

describe GadgetsController do
  let(:user) { create(:user) }
  let!(:gadget1) { create(:gadget, name: 'gadget1', user: user) }
  let!(:gadget2) { create(:gadget, name: 'gadget2', user: user) }
  let!(:other_user) { create(:user, email: 'admin2@example.com') }
  let!(:other_gadget) { create(:gadget, name: 'other gadget', user: other_user) }


  context 'with and active user session' do

    before do
      sign_in(user)
    end

    describe '#index' do
      it 'renders the #index view' do
        get :index
        expect(response).to render_template :index
      end

      it 'returns all gadgets of the current user' do
        get :index
        expect(assigns[:gadgets]).to eq([gadget1, gadget2])
      end

      it "doesn't return gadgets of other users" do
        get :index
        expect(assigns[:gadgets]).not_to include(other_gadget)
      end

      it 'restricts results when a search term is given' do
        params = {}
        params[:search] ='gadget1'
        get :index, params
        expect(assigns[:gadgets]).to eq([gadget1])
      end

      it 'assigns user gadgets' do
      end
    end

    describe '#new' do
      it 'renders the #index view' do
        get :index
        expect(response).to render_template :index
      end
    end

    describe '#create' do
      it 'renders the #index view' do
        get :index
        expect(response).to render_template :index
      end
    end

  end

  context 'without an active user session' do
    let(:new_gadget) { attributes_for(:gadget, name: 'my new gadget', user: user) }

    describe '#index' do
      it 'redirects to the home page' do
        get :index
        expect(response).to redirect_to root_path
      end
    end

    describe '#new' do
      it 'redirects to the home page' do
        get :new
        expect(response).to redirect_to root_path
      end
    end

    describe '#create' do
      it 'redirects to the home page' do
        post :create, { gadget: new_gadget }
        expect(response).to redirect_to root_path
      end
    end

  end
end
