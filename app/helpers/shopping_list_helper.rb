module ShoppingListHelper
  def calculate_missing_foods(recipe, inventory)
    missing_foods = []

    # Create a hash to store the quantity needed for each food in the recipe
    recipe_food_quantities = recipe.recipe_foods.group(:food_id).sum(:quantity)
    puts "Recipe Food Quantities: #{recipe_food_quantities.inspect}"

    # Iterate through the recipe's foods and check inventory
    recipe_food_quantities.each do |food_id, quantity_needed|
      # Find the food in the inventory
      inventory_food = inventory.inventory_foods.find_by(food_id: food_id)

      if inventory_food
        # Food exists in inventory
        quantity_available = inventory_food.quantity
        puts "RELATORY: Needed: #{quantity_needed} and Available:#{quantity_available}"
        if quantity_needed > quantity_available
          # Add the missing quantity to the list of missing foods
          missing_foods << {
            food_id: food_id,
            name: inventory_food.food.name, # Access food's name through inventory_food
            quantity_missing: quantity_needed - quantity_available,
            price: inventory_food.food.price * (quantity_needed - quantity_available)
          }
        end
      else
        # Food doesn't exist in inventory; add it all to the missing foods
        food = Food.find(food_id) # Find the food by ID
        missing_foods << {
          food_id: food_id,
          name: food.name, # Access food's name through the found food
          quantity_missing: quantity_needed,
          price: food.price * quantity_needed # Access food's price through the found food
        }
      end
    end

    return missing_foods
  end
end
