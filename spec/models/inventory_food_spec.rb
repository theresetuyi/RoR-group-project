require 'rails_helper'

RSpec.describe InventoryFood, type: :model do
  context 'Validation' do
    let(:interface) { InventoryFood.new }

    before do
      food = Food.create(measurement_unit: 'Kg', name: 'rice', price: 10)
      user = User.create(name: 'John', email: 'user@gmail.com', password: 'asdf@123')
      inventory = Inventory.new(user:, name: 'inventory_1', description: 'Description for inventory_1')

      interface.food = food
      interface.inventory = inventory
    end

    it 'case : in-valid' do
      interface.quantity = nil
      expect { interface.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'case : in-valid' do
      interface.quantity = 'a'
      expect { interface.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'case : valid' do
      interface.quantity = 1
      expect { interface.save! }.not_to raise_error(ActiveRecord::RecordInvalid)
      expect(interface).to be_valid
    end
  end
end
