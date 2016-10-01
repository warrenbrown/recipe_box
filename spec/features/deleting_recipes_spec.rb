require 'rails_helper'

RSpec.feature 'Users can delete recipes' do
  scenario 'successfully' do
    FactoryGirl.create(:recipe, title: 'Hamburger', description: "Sublime Text 3")

    visit "/"
    click_link "Hamburger"
    click_link 'Delete Recipe'

    expect(page).to have_content "Recipe has been deleted."
    expect(page.current_url).to eq recipes_url
    expect(page).to have_no_content 'Hamburger'
  end
end
