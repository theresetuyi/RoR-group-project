require 'rails_helper'

RSpec.feature "InventoryShows", type: :feature do
  let(:user) {
    User.create(name: 'john', email: 'user@gmail.com', password: 'user@123')
  }

  let(:inventory) {
    Inventory.create(name:'Inventory_name', description:'Details for inventory', user:user)
  }

  before(:each) {
    visit(inventory_path(inventory))
    
    fill_in('Email', with: user.email)
    fill_in('Password', with: user.password)
    click_on('Log in')
  }
  
  it 'Case : food added to inventory' do
    expect(page).to have_content('This inventory is empty.')
  end

  it 'Case : food is added' do
    click_on('Add New Food')

    fill_in('Name', with: 'food_name')
    select('Kilos', from: 'Measurement unit')
    fill_in('Price', with: 23)
    click_on('Next')
    
    fill_in("Quantity (Kilos)", with: 3)
    click_on('Save')

    expect(page).to have_content("food_name")
    expect(page).to have_content("3 Kilos")
  end
end
