require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    let(:valid_attributes) {
        {:name => 'abc',  :email => 'abd@gmail.com', :phone => '12345678', :password => 'abcabc'}
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

        it "should be able to edit profile" do


          user = User.create! valid_attributes
          put :update, :params => {id:1,:user => {:name => 'aaa',  :email => 'abd@gmail.com', :phone => '12345678', :password => 'abcabc'}}
          user.reload
          expect(user.name).to eq('aaa')
        end

        it "should not be able to edit profile" do


            user = User.create! valid_attributes
            put :update, :params => {id:1,:user => {:name => '',  :email => 'abd@gmail.com', :phone => '12345678', :password => 'abcabc'}}

            expect(response).to redirect_to(edit_user_path)
        end


    end


end
