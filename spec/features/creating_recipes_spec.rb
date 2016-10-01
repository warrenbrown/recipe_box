require 'rails_helper'

RSpec.feature 'Users can create recipes' do
  scenario 'with valid attributes' do
    visit '/'

    click_link 'New Recipe'

    fill_in 'Title', with: 'Curry Sauce'
    fill_in 'Description', with: 'Sauce for curry'
    click_button 'Create Recipe'

    expect(page).to have_content 'Recipe has been created.'
  end
end
