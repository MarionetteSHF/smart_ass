require 'rails_helper'

RSpec.describe User, type: :user do
    context 'create a user' do 
        it 'get maximum user id' do
            User.create(user_id:'1', name: "abc", phone:'12345678', email:'abc@gmail.com', encrypted_password:'abcabc')
            User.create(user_id:'2', name: "xyz", phone:'12345678', email:'xyz@gmail.com', encrypted_password:'xyzxyz')
            
            expect(User.set_user_id).to eql(3)
        end
    end
end