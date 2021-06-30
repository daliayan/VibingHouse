annie = User.create(username: "annie", password: "annie")

User.create([{username: 'peggy', password: 'peggy'}, {username: 'joe', password: 'joe'}])

first_room = Room.create([{name: "Bathroom"}])
second_room = Room.create([{name: "Master Bedroom"}])
third_room = Room.create([{name: "Kitchen"}])
fourth_room = Room.create([{name: "Sunroom"}])
fifth_room = Room.create([{name: "Dining Room"}])