require 'rails_helper'

RSpec.describe "UsersControllers", type: :request do
    describe 'get all users' do
        it 'should be able to get all users' do
            # post :create, user:{'name': 'abc', 'phone': '12345678', 'email': 'abd@gmail.com', 'encrypted_password': 'abcabc'}
            get "/users"
            expect(response).to have_http_status(200)
            # expect(notice).to match(/abc was successfully created/)
            # expect(response).to redirect_to(user_path)
        end

        # it 'should be able to create a user account' do
        #     # user: => {'name': 'abc', 'phone': '12345678', 'email': 'abd@gmail.com', 'encrypted_password': 'abcabc'}
        #     # post :create, user:{'name': 'abc', 'phone': '12345678', 'email': 'abd@gmail.com', 'encrypted_password': 'abcabc'}
        #     post "/users", :params => {'name': 'abc', 'phone': '12345678', 'email': 'abd@gmail.com', 'encrypted_password': 'abcabc'}
        #     # expect(notice).to match(/abc was successfully created/)
        #     expect(response).to redirect_to(user_path)
        # end
    end

end
