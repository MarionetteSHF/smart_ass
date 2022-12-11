require 'rails_helper'

RSpec.describe "Comments", type: :request do
    let(:item1) {
        {:title=>"iPhone", :description=>"a new iphone", :price=>500, :number=>1, :category=>'IT', :user_id=>1}
    }
    let(:item2) {
        {:title=>"iPad", :description=>"a new ipad", :price=>300, :number=>1, :category=>'IT', :user_id=>1}
    }
    let(:mock_user1) {
    {:phone=>"412377", :name=>"Wu", :email=>"wuw@sina.cn", :password=>"123445"}
    }
    let(:comment) {
        {description: 'mock1', user_id: 1, item_id:1}
    }
    let(:comment_invalid) {
        {description: 'mock2', user_id: 1, item_id:3}
    }

    describe 'background with user logged in and item created' do
        before(:each) do 
            @user = User.create! mock_user1
            @current_user = @user.id
            post '/login', params: {session: mock_user1}
            
            @item1 = Item.create! item1
            @item2 = Item.create! item2
      
          end

        describe 'POST /items/:id/comment' do
            it 'create a item' do
                post create_comment_path(@item1.id), params: comment
                expect(response).to redirect_to(item_path(@item1.id))
            end

            it 'should not create if item not exists' do
                expect {
                    post create_comment_path(3), params: comment_invalid
                  }.to change(Comment, :count).by(0)
            end
        end

        describe 'GET /items/:id' do
            it 'get an item with comment' do
                Comment.create! comment
                get item_path(@item1.id)
                expect(response).to render_template("show")
            end
        end

    end

    describe "no use logged in" do
        it "should return to login page" do 
            @user = User.create! mock_user1
            @item1 = Item.create! item1
            post create_comment_path(@item1.id), params: comment
            expect(response).to redirect_to(login_path)
        end
    end

end
