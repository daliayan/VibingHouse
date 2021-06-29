annie = User.create(username: "annie", password: "annie")

User.create([{username: 'peggy', password: 'peggy'}, {username: 'joe', password: 'joe'}])

first_room = Room.create([{name: "Restroom", description: "Duty gets done."}])
second_room = Room.create([{name: "Master Bedroom", description:"Sleepy Times." }])
# third_room = Room.create([{}])
# fourth_room = Room.create([{}])
# fifth_room = Room.create([{}])