annie = User.create(username: "annie", password: "annie")

User.create([{username: 'peggy', password: 'peggy'}, {username: 'joe', password: 'joe'}])

first_room = Room.create([{name: "Restroom", description: "Duty gets done."}])