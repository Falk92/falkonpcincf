require 'rails_helper'

  describe Product do

    context "comments & rating" do
    
      before do 
        @product = build(:product, name: "Testproduct", description: "testdescription", image_url: "testurl.jpg", colour: "colour")
        @user = build(:user, email: "test@test.com", password: "123456789", password_confirmation: "123456789")
        @comments = build(:comment, body: "This is a comment", rating: 5)
      end

      it "should give the average rating of 5" do
        expect(@comments.rating).to eq 5
      end


    end

  end