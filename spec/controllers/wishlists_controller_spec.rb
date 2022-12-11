RSpec.describe WishlistsController, type: :controller do
  let(:valid_attributes) {
    {:name => 'abc',  :email => 'abd@gmail.com', :phone => '12345678', :password => 'abcabc'}
  }
  let(:new_item) {
    {:title => 'mouse', :description => 'a used mouse', :price => '20', :number=> 1, :category=>"IT",  :user_id => 1, :images => [] }
  }

  describe "GET /create" do
    it 'should be able to add item to wishlist' do
      session[:user_id] = 1
      user = User.create! valid_attributes
      item = Item.create! new_item

      get :create, :params => {:id => 1}
      # expect(flash[:notice]).to match(/abc was successfully created/)

      expect(response).to redirect_to(wishlists_path)
    end

    it 'should not be able to add item to wishlist' do
      session[:user_id] = 1
      user = User.create! valid_attributes
      item = Item.create! new_item
      session[:user_id] = nil
      get :create, :params => {:id => 1}
      # expect(flash[:notice]).to match(/abc was successfully created/)

      expect(response).to redirect_to(sessions_create_path)
    end

    it 'should  be able to go to myitem page' do
      session[:user_id] = 1
      user = User.create! valid_attributes
      item = Item.create! new_item
      
      get :myitems, :params => {:id => 1}
      # expect(flash[:notice]).to match(/abc was successfully created/)

      expect(response).to render_template('myitems')
    end
  end

  describe "GET /index" do
    it 'should be able to go to wishlist page' do
      User.create! valid_attributes
      session[:user_id] = 1
      item = Item.create! new_item
      get :create, :params => {:id => 1}
      get :index
      expect(response).to render_template('index')
    end

  end

  describe "DELETE /destroy" do
    it 'should be able to go to delete the item from wishlist' do
      User.create! valid_attributes
      session[:user_id] = 1
      item = Item.create! new_item
      get :create, :params => {:id => 1}
      delete :destroy, :params => {:id => 1}
      expect(response).to redirect_to(wishlists_path)
    end
  end



end