require 'rails_helper'

RSpec.feature "InventoryNewSpec.rbs", type: :feature do
  context 'inventory_new' do
    let(:user) {
      User.create(name: 'john', email: 'user@gmail.com', password: 'user@123')
    }
   
    it 'case : add new inventory' do
      visit(inventories_path)
      fill_in('Email', with: user.email)
      fill_in('Password', with: user.password)
      click_on('Log in')
      
      add_btn = find("#add_inventory")
      add_btn.click
      expect(page).to have_current_path('/inventories/new')
      fill_in('Name', with: 'InventoryName')
      fill_in('Description', with: 'Details about the inventory')
      click_on('Save')

      expect(page).to have_current_path('/')
      expect(page).to have_content('InventoryName')
      expect(page).to have_content('Details about the inventory')
    end
  end
end
