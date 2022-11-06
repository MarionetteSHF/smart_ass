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


end
