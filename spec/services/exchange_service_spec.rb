require 'spec_helper'
require 'json'
require './app/services/exchange_service'

describe 'Currency' do
  it 'exchange' do
    amount = rand(0.9999)
    response = ExchangeService.new("USD", "BRL", amount).exchange
    expect(response.is_a? Numeric).to eql(true)
    expect(response != 0 || amount == 0).to eql(true)
  end
end