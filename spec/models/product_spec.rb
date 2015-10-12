require 'rails_helper'

descripe Product do

  before do
    @product = Product.create(:name => "Best online shop")
    @user = User.create(:email => "test@mail.com", :password => "testpassword")
    @product.comments.create(:rating => 1, :user => @user, :body => "Not really the best shop.")
    @product.comments.create(:rating => 3, :user => @user, :body => "The middle best shop.")
    @product.comments.create(:rating => 5, :user => @user, :body => "Really the best.")
  end

  context "GET #index" do
    before do
      sign_in @user
      get :index, id: @user.id
    end
    
  it "returns the average rating of all comments" do
    expect(@product.average_rating).to eq "3"
  end
end
