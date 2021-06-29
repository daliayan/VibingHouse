annie = User.create(username: "annie", password: "annie")

User.create([{username: 'peggy', password: 'peggy'}, {username: 'joe', password: 'joe'}])

first_room = Room.create([{name: "Bathroom", description: "Duty gets done."}])
second_room = Room.create([{name: "Master Bedroom", description:"Sleepy Times."}])
third_room = Room.create([{name: "Kitchen", description: "A place to eat!"}])
fourth_room = Room.create([{name: "Sunroom", description: "Soaking in Sunshine"}])
fifth_room = Room.create([{name: "Dining Room", description: "Gather and be happy."}])