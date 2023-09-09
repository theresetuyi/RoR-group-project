require 'rails_helper'

RSpec.feature 'RecipesNewSpec.rbs', type: :feature do
  context 'recipes_new' do
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

      expect(page).to have_current_path(%r{/recipes/})
      expect(page).to have_content('RecipeName')
      expect(page).to have_content('Steps: Steps how to make the recipe')
      expect(page).to have_content('Cooking time: 2')
      expect(page).to have_content('Preparation time: 2')
      expect(page).to have_content('Public')
      expect(page).to have_content('Recipe Foods')
      expect(page).to have_content('Generate Shopping List')
      expect(page).to have_content('Select ingredients to Add')
    end
  end
end
