require 'rails_helper'

RSpec.describe "Exchanges", type: :request do
  
  describe 'GET #index' do
    it 'Have Http Status 200 when access Index' do
      get '/'
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #convert' do 
    before do 
      @amount = rand(0..9999)
    end

    it 'return http success' do
    get '/convert', params: {from_currency: 'BRL', to_currency: 'EUR', amount: 100}
      expect(response).to have_http_status(200)
    end
  end
end
