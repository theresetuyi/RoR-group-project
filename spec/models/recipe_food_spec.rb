require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  let(:interface) {
    RecipeFood.new
  }

  context 'Validation' do
    before {
      user =  User.create(name: 'John', email: 'user@gmail.com', password: 'asdf@123')

      recipe = Recipe.create(user:user, name:'Recipe_name', description:'recipe_description')
      

      food = Food.create(measurement_unit: 'Kg', name: 'rice', price: 10)
      
      interface.recipe = recipe
      interface.food = food
    }

    it 'Case: valied' do
      expect(interface).to be_valid
    end
  end
end
