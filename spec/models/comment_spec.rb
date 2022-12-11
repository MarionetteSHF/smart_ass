require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:valid_attributes) {
    {:title=>"iPhone", :description=>"a new iphone", :price=>500, :number=>1, :category=>'IT', :user_id=>1}
  }
  describe 'create a user' do 
    it 'create' do
        user = User.create( name: "abc", phone:'12345678', email:'abc@gmail.com', password:'abcabc')  
        item = Item.create! valid_attributes    
        Comment.create(description: 'mock', item_id: item.id, user_id: user.id)
        expect(Comment.all.length).to eq(1)
    end
  end
end
