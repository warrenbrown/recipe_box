require 'rails_helper'

RSpec.feature 'Users can view recipe' do
  scenario 'successfulle' do
    FactoryGirl.create(:recipe, title: 'Terryaki chicken', description: 'Chicken')

    visit '/'

    click_link 'Terryaki chicken'

    expect(page).to have_content 'Terryaki chicken'
  end
end
