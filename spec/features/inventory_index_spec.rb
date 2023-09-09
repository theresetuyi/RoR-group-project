require 'rails_helper'

RSpec.feature 'InventoryIndices', type: :feature do
  context 'inventory_index' do
    let(:user) do
      User.create(name: 'john', email: 'user@gmail.com', password: 'user@123')
    end

    it 'check authentication' do
      visit(inventories_path)
      expect(page).to have_current_path('/accounts/login')
    end

    it 'check /inventory' do
      visit(inventories_path)
      fill_in('Email', with: user.email)
      fill_in('Password', with: user.password)
      click_on('Log in')
      expect(page).to have_current_path(inventories_path)
      expect(page).to have_content('Inventories')
      expect(page).to have_content("User: #{user.name}")
    end
  end
end
