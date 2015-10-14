require 'rails_helper'

describe UsersController, :type => :controller do
  before do
    @user = FactoryGirl.create(:user)
  end

  describe "GET #show" do
    context "User is logged in" do
      before do
        session[:user_id] = @user.id
        put :show, id: @user.id
        response.should be_success
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user
      end
    end

    context "No user is logged in" do
      it "redirects to login" do
        put :show, id: @user.id
        expect(response).to redirect_to('/users/sign_in')
      end
    end
  end
end
    