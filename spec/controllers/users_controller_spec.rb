require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe 'new user' do
        it 'should be able to create a user account' do
            post :create, :params => {:user => {:name => 'abc',  :email => 'abd@gmail.com', :phone => '12345678', :password => 'abcabc'}}
            # expect(flash[:notice]).to match(/abc was successfully created/)
            expect(response).to redirect_to(items_path)
        end

        # it "return 200 for going to a new page" do
      
        #     get :new
        #     expect(response).to have_http_status(:ok)
        # end
    end
end
