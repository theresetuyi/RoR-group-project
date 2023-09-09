require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  let(:interface) do
    RecipeFood.new
  end

  context 'Validation' do
    before do
      user = User.create(name: 'John', email: 'user@gmail.com', password: 'asdf@123')

      recipe = Recipe.create(user:, name: 'Recipe_name', description: 'recipe_description')


      food = Food.create(measurement_unit: 'Kg', name: 'rice', price: 10)

      interface.recipe = recipe
      interface.food = food
    end

    it 'Case: valied' do
      expect(interface).to be_valid
    end
  end
end
