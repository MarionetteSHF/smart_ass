require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'login' do
    it 'should be able to login' do
      User.create(phone: '6462345569', email: 'wangdazhuang@gmail.com', password: '25-Nov-1992', name: 'hanfushi')
      post :create, :params => {:session => {:email => 'wangdazhuang@gmail.com',  :password => '25-Nov-1992'}}
      # expect(flash[:notice]).to match(/abc was successfully created/)
      expect(response).to redirect_to(items_path)
    end

    it 'should not be able to login' do
      User.create(phone: '6462345569', email: 'wangdazhuang@gmail.com', password: '25-v-1992', name: 'hanfushi')
      post :create, :params => {:session => {:email => 'wangdazhuang@gmail.com',  :password => '25-Nov-1992'}}
      # expect(flash[:notice]).to match(/abc was successfully created/)
      expect(response).to render_template('sessions/new')
    end
  end


end