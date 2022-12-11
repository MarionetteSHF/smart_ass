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

        it 'should  be able to logout' do
            post :create, :params => {:user => {:name => '',  :email => 'abd@gmail.com', :phone => '12345678', :password => 'abcabc'}}
            # expect(flash[:notice]).to match(/abc was successfully created/)
            get :logout
            expect(response).to redirect_to(items_path)
        end

        it 'can not create user with same email' do
            post :create, :params => {:user => {:name => 'aa',  :email => 'abd@gmail.com', :phone => '12345678', :password => 'abcabc'}}
            # expect(flash[:notice]).to match(/abc was successfully created/)
            post :create, :params => {:user => {:name => 'aa',  :email => 'abd@gmail.com', :phone => '12345678', :password => 'abcabc'}}
            expect(flash[:notice]).to match(/email has been used/)
            expect(response).to render_template('index')
        end

        it 'can not create user with same phone' do
            post :create, :params => {:user => {:name => 'aa',  :email => 'abd@gmail.com', :phone => '12345678', :password => 'abcabc'}}
            # expect(flash[:notice]).to match(/abc was successfully created/)
            post :create, :params => {:user => {:name => 'aa',  :email => 'abdaa@gmail.com', :phone => '12345678', :password => 'abcabc'}}
            
            expect(response).to render_template('index')
        end

        

    end

    describe 'edit a  user' do
        it 'should not be able to go to editing page' do
            post :create, :params => {:user => {:name => 'a',  :email => 'abd@gmail.com', :phone => '12345678', :password => 'abcabc'}}

            get :edit, :params => {:id => 1}
            expect(response).to render_template('edit')

        end

        it 'should not be able to edit password' do
            post :create, :params => {:user => {:name => 'a',  :email => 'abd@gmail.com', :phone => '12345678', :password => 'abcabc'}}

            get :reset, :params => {:id => 1}
            expect(response).to render_template('reset')

        end

        it "should be able to edit profile" do


          user = User.create! valid_attributes
          put :update, :params => {id:1,:user => {:name => 'aaa',  :email => 'abd@gmail.com', :phone => '12345678'}}
          user.reload
          expect(user.name).to eq('aaa')
        end

        it "should not be able to edit profile" do


            user = User.create! valid_attributes
            put :update, :params => {id:1,:user => {:name => '',  :email => 'abd@gmail.com', :phone => '12345678'}}

            expect(response).to redirect_to(edit_user_path)
        end

        it "should have both fields" do


            user = User.create! valid_attributes
            put :update, :params => {id:1,:user => {:password => '',  :password_confirmation => 'abd@gmail.com'}}

            expect(response).to redirect_to(reset_password_path)
        end
        
        it "should have enter same password twice" do


            user = User.create! valid_attributes
            put :update, :params => {id:1,:user => {:password => 'abd@gm',  :password_confirmation => 'abd@gmail.com'}}

            expect(response).to redirect_to(reset_password_path)
        end

        it "should have  a different password" do


            user = User.create! valid_attributes
            put :update, :params => {id:1,:user => {:password => 'abcabc',  :password_confirmation => 'abcabc'}}

            expect(response).to redirect_to(reset_password_path)
        end

        

        it "should update the password successfully" do


            user = User.create! valid_attributes
            put :update, :params => {id:1,:user => {:password => 'abd@gmail.com',  :password_confirmation => 'abd@gmail.com'}}

            expect(response).to redirect_to(profile_path)
        end

    end


end
