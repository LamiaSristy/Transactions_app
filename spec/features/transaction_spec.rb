require 'rails_helper'

RSpec.feature Transaction, type: :feature do
  scenario 'In the Transaction page' do
    visit 'transactions'
    expect(page).to have_content('Copyright')
  end
  scenario 'User Seen  the link' do
    visit 'transactions'
    expect(page).to have_no_button('Save')
  end
end
