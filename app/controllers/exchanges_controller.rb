class ExchangesController < ApplicationController
  def index
    
  end

  def convert
    value = ExchangeService.new(params[:from_currency], 
                                params[:to_currency], 
                                params[:amount]).exchange
                                
    render json: { value: value}
  end
end
