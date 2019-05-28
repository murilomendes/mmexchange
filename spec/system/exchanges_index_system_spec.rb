require 'rails_helper'

RSpec.describe 'Main Exchange Process', type: :system, js: true do

  it 'Get Value from Exchange Process' do
    visit '/'

    within('#exchange_form') do
      select 'EUR', from: 'from_currency'
      select 'BRL', from: 'to_currency'
      fill_in 'amount', with: rand(0..9999)
    end

    page.find_button("CONVERTER", visible: :hidden, wait: 1).click

    #save_and_open_page
    expect(page).to have_content('value')
  end
end
