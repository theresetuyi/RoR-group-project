require 'rails_helper'

RSpec.describe Recipe, type: :model do
  context 'Validation' do
    let(:recipe) { Recipe.new }
    let(:user) { User.create(name: 'John', email: 'user@gmail.com', password: 'asdf@123') }

    it 'case: Error' do

      # check the error
      expect { recipe.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'case: Valid' do
      recipe.name = 'name_of_recipe'
      recipe.description = 'some description for the recipe'
      recipe.user = user

      # check the validation
      expect { recipe.save! }.not_to raise_error(ActiveRecord::RecordInvalid)
      expect(recipe).to be_valid
    end

  end
end
