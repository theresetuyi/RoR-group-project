require 'rails_helper'

RSpec.feature 'RecipesAddFood', type: :feature do
  let(:user) do
    User.create(name: 'john', email: 'user@gmail.com', password: 'user@123')
  end

  it 'case : add new recipe' do
    visit(recipes_path)
    fill_in('Email', with: user.email)
    fill_in('Password', with: user.password)
    click_on('Log in')

    add_btn = find('#add_recipe')
    add_btn.click
    expect(page).to have_current_path('/recipes/new')
    fill_in('Name', with: 'RecipeName')
    fill_in('Description', with: 'Details about the recipe')
    fill_in('Steps', with: 'Steps how to make the recipe')
    fill_in('Cooking Time (minutes)', with: '2')
    fill_in('Preparation Time (minutes)', with: '2')
    click_on('Create Recipe')

    expect(page).to have_content('This recipe has no ingredients yet.')

    click_on('Select ingredients to Add')

    fill_in('food[name]', with: 'food_name') # Use 'food[name]' for the input field name
    select('Kilos', from: 'food[measurement_unit]') # Use 'food[measurement_unit]' for the select field name
    fill_in('food[price]', with: 23) # Use 'food[price]' for the input field name

    click_on('Create Ingredient')

    select('food_name', from: 'food_id') # Use the actual name of the food
    fill_in('Qty', with: 3)
    click_on('Add Selected Ingredient')

    visit recipes_path

    click_on('RecipeName')

    expect(page).to have_content('food_name')
    expect(page).to have_content('3')
  end
end
