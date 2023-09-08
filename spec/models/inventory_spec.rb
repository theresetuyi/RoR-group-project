require 'rails_helper'

RSpec.describe Inventory, type: :model do
  context 'Validataion' do
    let(:user) {User.create(name:'John', email:'user@gmail.com', password:'asdf@123')}
    let(:inventory) {Inventory.new()}
    
    # check the error
    it 'Case : invalid' do
        expect { inventory.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'Case : Valid' do
      inventory.user = user
      inventory.name = 'inventory_1'
      inventory.description = 'Description for inventory_1'
      expect { inventory.save! }.not_to raise_error(ActiveRecord::RecordInvalid)

      expect(inventory).to be_valid
    end
  end
end
