require 'rails_helper'

describe UsersController, :type => :controller do
  before do
    @user = User.create(:email => "test@mail.com", :password => "testpassword")
    @user = User.create(:email => "test2@mail.com", :password => "testpassword")
  end

  describe "GET #show" do
    context "Wrong User is logged in" do
      before do
        sign_in @user.2
        get :show, id: @user.1
      end
      it "response with failure" do
        expect(response).to have_http_status(302)
        expect(response).to redirect_to('root_path')
      end
    end
  end
end