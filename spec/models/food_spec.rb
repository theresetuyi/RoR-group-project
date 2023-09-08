require 'rails_helper'

RSpec.describe Food, type: :model do
  context 'Validation' do
    let(:food) {Food.new}
    it 'case: in-valid' do
      expect { food.save! }.to raise_error(ActiveRecord::RecordInvalid) 
    end

    it 'case: valid' do
      food.measurement_unit = 'kilo'
      food.name = 'rice'
      food.price = 120
      expect { food.save! }.not_to raise_error(ActiveRecord::RecordInvalid)
      expect(food).to be_valid
    end
  end
end
