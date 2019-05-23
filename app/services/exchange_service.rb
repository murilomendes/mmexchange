class ExchangeService
  def initialize(from_currency, to_currency, amount)
    @from_currency = from_currency
    @to_currency = to_currency
    @amount = amount.to_f
  end

  def exchange
    begin
      url = Rails.application.credentials[Rails.env.to_sym][:currency_api_url]
      token = Rails.application.credentials[Rails.env.to_sym][:currency_api_key]
      params = {token: token, currency: "#{@from_currency}/#{@to_currency}"}

      response = RestClient.get(url, params: params)
      value = JSON.parse(response.body)['currency'].first['value'].to_f

      @amount * value
    rescue RestClient::ExceptionWithResponse => e 
      e.response
    end
  end
end