require 'rails_helper'

RSpec.describe User, type: :user do
    context 'create a user' do 
        it 'get maximum user id' do
            User.create( name: "abc", phone:'12345678', email:'abc@gmail.com', password:'abcabc')
            User.create( name: "xyz", phone:'12345678', email:'xyz@gmail.com', password:'xyzxyz')
            
            expect(User.where("name = ?", "abc").length).to eq(1)
            expect(User.where("phone = ?", "12345678").length).to eq(2)
        end
    end
end