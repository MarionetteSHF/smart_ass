require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    let(:valid_attributes) {
        {:name => 'abc',  :email => 'abd@gmail.com', :phone => '12345678', :password => 'abcabc'}
    }

    let(:invalid_attributes) {
        {:name => nil,  :email => 'abd@gmail.com', :phone => nil, :password => 'abcabc'}
    }

    describe 'POST /create' do
        context 'with valid parameters' do
            it 'should be able to create a user account' do
                post :create, :params => {:user => {:name => 'abc',  :email => 'abd@gmail.com', :phone => '12345678', :password => 'abcabc'}}
                # expect(flash[:notice]).to match(/abc was successfully created/)
                expect(response).to redirect_to(items_path)
            end
        end
        context "with invalid parameters" do
            it 'should not be able to create a user account' do
                post :create, :params => {:user => {:name => '',  :email => 'abd@gmail.com', :phone => '12345678', :password => 'abcabc'}}
                # expect(flash[:notice]).to match(/abc was successfully created/)
                expect(response).to render_template('users/index')
            end
        end

        it 'should not be able to logout' do
            post :create, :params => {:user => {:name => '',  :email => 'abd@gmail.com', :phone => '12345678', :password => 'abcabc'}}
            # expect(flash[:notice]).to match(/abc was successfully created/)
            get :logout
            expect(response).to redirect_to(items_path)
        end

    end

    describe 'edit a  user' do
        it 'should not be able to go to editing page' do
            post :create, :params => {:user => {:name => 'a',  :email => 'abd@gmail.com', :phone => '12345678', :password => 'abcabc'}}
            get :edit
            expect(response).to render_template('edit')

        end
        context "with valid parameters" do

            let(:valid_attributes) {
                {:user => {:name => 'a',  :email => 'abd@gmail.com', :phone => '12345678', :password => 'abcabc'}
            }
            let(:new_attributes) {
                {:user => {:name => 'a',  :email => 'abd@gmail.com', :phone => '12345678', :password => 'abcabc'}
            }
                it 'should not be able to go to update successfully' do
            item = Item.create! valid_attributes
            patch item_url(item), params: { item: new_attributes }
            item.reload
            expect(item.price).to eq(1000)

            user = User.create! valid_attributes
            # post :create, :params => {:user => {:name => 'a',  :email => 'abd@gmail.com', :phone => '12345678', :password => 'abcabc'}}
            session[:user_id] = 1
                put update    , params: { item: new_attributes }
            # put :update, {'a' => 1}
            expect(response).to render_template('edit')

                end
                end
                end

    end

    describe "GET /edit" do
        it "renders a successful response" do
          user = User.create! valid_attributes
          get edit_profile_url(user)
          expect(response).to be_successful
        end
    end

    describe "PATCH /update" do
        context "with valid parameters" do
            let(:new_attributes) {
                {:name => 'abc',  :email => 'abd@gmail.com', :phone => '87654321', :password => 'abcabc'}
            }
    
          it "updates the current user information" do
            user = User.create! valid_attributes
            patch user_url(user), params: { user: new_attributes }
            user.reload
            expect(user.phone).to eq('87654321')
          end
    
          it "redirects to the user profile page" do
            user = User.create! valid_attributes
            patch user_url(user), params: { user: new_attributes }
            user.reload
            expect(response).to redirect_to(user_url(user))
          end
        end
    
        context "with invalid parameters" do
        
          it "renders a response with 422 status" do
            user = User.create! valid_attributes
            patch user_url(user), params: { user: invalid_attributes }
            expect(response.status).to eq(422)
          end
        end
    end
end
