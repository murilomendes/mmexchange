RSpec.configure do |config|
  config.before(:each) do   
    stub_request(:get, /free.currconv.com/ )
    .with(headers: {
      'Accept'=>'*/*'
    }).to_return(status: 200, body: '
      {
        "BTC_BRL": 31792.018704
      }', headers: {})
  end
end