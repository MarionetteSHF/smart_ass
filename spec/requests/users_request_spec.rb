require 'rails_helper'

RSpec.describe "UsersControllers", type: :request do


    describe 'show' do
        it 'should go to profile' do
            user =User.create(phone: '6462345569', email: 'wangdazhuang@gmail.com', password: '25-v-1992', name: 'hanfushi')
            # get "/users"
            # item = Item.create! valid_attributes
            # session[:user_id] = 1
            get '/users/1'
            expect(response).to be_successful
            # expect(flash[:notice]).to match(/abc was successfully created/)
            # expect(response).to render_template('sessions/show')
        end
    end

    describe 'reset' do
        # it 'should go to reset page' do
        #     user =User.create(phone: '6462345569', email: 'wangdazhuang@gmail.com', password: '25-v-1992', name: 'hanfushi')
        #     # session[:user_id] = 1
        #     get '/users/1'
        #     get '/users/1/reset'
        #     expect(response).to be_successful
            
        # end

        # it 'should go to editing page' do
        #     session[:user_id] = 1
        #     user =User.create(phone: '6462345569', email: 'wangdazhuang@gmail.com', password: '25-v-1992', name: 'hanfushi')
            
        #     get '/users/1/edit'
        #     expect(response).to be_successful
            
        # end
    end
    # it "should be able to edit profile" do
    #     user = User.create! valid_attributes
    #     # post :create, :params => {:user => {:name => 'a',  :email => 'abd@gmail.com', :phone => '12345678', :password => 'abcabc'}}
    #     # session[:user_id] = 1
    #     put '/users/1/edit', params: {:name => 'aaa',  :email => 'abd@gmail.com', :phone => '12345678', :password => 'abcabc'}
    #     # put user_path(@user), params: { user: new_attributes }
    #     # put update, params: { item: new_attributes }
    #     # put :update, {'a' => 1}
    #     expect(response).to be_successful
    # end


end
