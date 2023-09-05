user1 = User.create(name:'Ali')

inventory1 = Inventory.create(user:user1, name:'first_inventory', description:'details for thie inventory')

inventory2 = Inventory.create(user:user1, name:'invent_1', description:'details for this invent_1')
inventory3 = Inventory.create(user:user1, name:'invent_2', description:'details for this invent_2')
inventory3 = Inventory.create(user:user1, name:'invent_3', description:'details for this invent_3')