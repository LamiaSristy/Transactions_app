require 'rails_helper'

RSpec.feature Group, type: :feature do
  scenario 'User in the All Group Page' do
    visit 'groups'
    expect(page).to have_content('Copyright')
  end
  scenario 'User Seen  the link' do
    visit 'groups'
    expect(page).to have_no_button('Save')
  end
end
