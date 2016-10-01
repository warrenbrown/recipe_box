require 'rails_helper'

RSpec.feature 'Users can edit recipes' do
  scenario 'with valid attributes' do
    FactoryGirl.create(:recipe, title: 'Hamburger', description: "Sublime Text 3")

    visit "/"
    click_link "Hamburger"
    click_link "Edit Recipe"
    fill_in "Title", with: "Cheese Burger"
    click_button "Update Recipe"

    expect(page).to have_content "Recipe has been updated."
    expect(page).to have_content "Cheese Burger"
  end
end
