require 'rails_helper'

RSpec.feature 'RecipesIndices', type: :feature do
  context 'recipes_index' do
    let(:user) do
      User.create(name: 'john', email: 'user@gmail.com', password: 'user@123')
    end

    it 'check authentication' do
      visit(recipes_path)
      expect(page).to have_current_path('/accounts/login')
    end

    it 'check /recipes' do
      visit(recipes_path)
      fill_in('Email', with: user.email)
      fill_in('Password', with: user.password)
      click_on('Log in')
      expect(page).to have_current_path(recipes_path)
      expect(page).to have_content('My Recipes')
      expect(page).to have_content("User: #{user.name}")
    end
  end
end
