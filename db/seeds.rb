user1 = User.create(name:'Ali')
user2 = User.create(name:'John')

inventory1 = Inventory.create(user:user1, name:'first_inventory', description:'details for thie inventory')

inventory2 = Inventory.create(user:user1, name:'invent_2',description:'details for this invent_1')
inventory3 = Inventory.create(user:user2, name:'invent_3', description:'details for this invent_2')
inventory4 = Inventory.create(user:user2, name:'invent_4', description:'details for this invent_3')

food1 = Food.create(name:'Apple', measurement_unit: 'grams', price: 20)
food2 = Food.create(name:'Orange', measurement_unit: 'grams', price: 10)
food3 = Food.create(name:'Vegetables', measurement_unit: 'grams', price: 4)
food4 = Food.create(name:'Chicken_Breast', measurement_unit: 'unit', price: 50)

invent_food_1 = InventoryFood.create(food:food1, inventory: inventory1, quantity: 23)
invent_food_2 = InventoryFood.create(food:food2, inventory: inventory2, quantity: 24)

invent_food_3 = InventoryFood.create(food:food3, inventory: inventory3, quantity: 3)
invent_food_4 = InventoryFood.create(food:food4, inventory: inventory4, quantity: 13)
