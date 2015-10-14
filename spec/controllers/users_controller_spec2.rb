require 'rails_helper'

describe UsersController, :type => :controller do
  before do
    @user1 = User.create(:email => "test@mail.com", :password => "testpassword")
    @user2 = User.create(:email => "test2@mail.com", :password => "testpassword")
  end

  describe "GET #show" do
    context "User is logged in" do
      before do
        sign_in @user2
        get :show, id: @user2
        response.should be_success
        expect(response).to have_http_status(302)
        expect(response).to redirect_to('lol')
      end
    end
  end
end