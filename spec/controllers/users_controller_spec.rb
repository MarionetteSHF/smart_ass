require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe 'create a new user' do
        it 'should be able to create a user account' do
            post :create, :params => {:user => {:name => 'abc',  :email => 'abd@gmail.com', :phone => '12345678', :password => 'abcabc'}}
            # expect(flash[:notice]).to match(/abc was successfully created/)
            expect(response).to redirect_to(items_path)

        end

        it 'should not be able to create a user account' do
            post :create, :params => {:user => {:name => '',  :email => 'abd@gmail.com', :phone => '12345678', :password => 'abcabc'}}
            # expect(flash[:notice]).to match(/abc was successfully created/)
            expect(response).to render_template('users/index')
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


end
