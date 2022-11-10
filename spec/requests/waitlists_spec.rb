require 'rails_helper'

RSpec.describe "Waitlists", type: :request do
  let(:user_attributes) {
    {:name => 'abc',  :email => 'abd@gmail.com', :phone => '12345678', :password => 'abcabc'}
  }

  let(:user_attributes) {
    {:name => 'xyz',  :email => 'xyz@gmail.com', :phone => '87654321', :password => 'xyzxyz'}
  }

  let(:item_attributes) {
    {:title=>"iPhone", :description=>"a new iphone", :price=>500, :number=>1, :neededItem=>false, :category=>'IT'}
  }

  let(:valid_attributes) {
    {:user_id => 2, :item_id => 1}
  }
  
  let(:invalid_attributes) {
    {:user_id => 2, :item_id => 2}
  }

  describe "GET /index" do
    it "renders a successful response" do
      User.create! user_attributes
      Item.create! item_attributes
      Wishlist.create! valid_attributes
      get wishlists_url
      expect(response).to be_successful
    end
  end
end
