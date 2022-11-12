require 'rails_helper'

RSpec.describe "Waitlists", type: :request do
  let(:valid_attributes) {
    {:user_id => 1, :item_id => 1}
  }
  
  let(:invalid_attributes) {
    {:user_id => 200, :item_id => 100}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Wishlist.create(user_id: 1, item_id: 1)
      Wishlist.create(user_id: 1, item_id: 2)
      get wishlists_url
      expect(response).to be_successful
    end
  end

  describe "POST /wishlists" do
    context "with valid parameters" do
      let(:create_wishlist) {
          Wishlist.create(user_id: 1, item_id: 1)
      }
      it "add a new Item to User's Wishlist" do
        @user = User.create(name: 'abc', email: 'abd@gmail.com', phone: '12345678', password: 'abcabc')
        @item = Item.create(title: "iPhone", description: "a new iphone", price: 500, number: 1, neededItem: false, category:'IT')
        expect{
          create_wishlist
        }.to change(Wishlist, :count).by(1)
      end

      it "redirects to the updated wishlist" do
        post wishlists_url, params: { wishlist: valid_attributes }
        expect(response).to redirect_to(sessions_create_path)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Item" do
        expect {response
          post wishlists_url, params: { waitlist: invalid_attributes }
        }.to change(Wishlist, :count).by(0)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the item from wishlist" do
      wishlist = Wishlist.create! valid_attributes
      expect { 
        wishlist.destroy
      }.to change(Wishlist, :count).by(-1)

    end

    it "redirects to the wishlist" do
      wishlist = Wishlist.create! valid_attributes
      delete wishlist_url(wishlist)
      expect(response).to redirect_to(sessions_create_path)
    end
  end
end
