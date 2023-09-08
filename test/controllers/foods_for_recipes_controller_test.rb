require 'test_helper'

class FoodsForRecipesControllerTest < ActionDispatch::IntegrationTest
  test 'should get create_for_recipe' do
    get foods_for_recipes_create_for_recipe_url
    assert_response :success
  end
end
