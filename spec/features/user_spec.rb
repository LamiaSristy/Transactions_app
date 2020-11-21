require 'rails_helper'

RSpec.feature User, type: :feature do
  scenario 'User Seen the button Log-in' do
    visit 'users/sign_in'
    expect(page).to have_content('Copyright')
  end
  scenario 'User Seen the button Sign-up' do
    visit 'users/sign_up'
    expect(page).to have_content('Copyright')
  end
  scenario 'User not Seen the button Save' do
    visit 'users/sign_in'
    expect(page).to have_no_button('Save')
  end
  scenario 'User not Seen the button Save' do
    visit 'users/sign_up'
    expect(page).to have_no_button('Save')
  end
end
