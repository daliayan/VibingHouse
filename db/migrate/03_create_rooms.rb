class CreateRooms < ActiveRecord::Migration[5.2]
    def change
        create_table :rooms do |t|
            t.string :name
            t.text :room_description
            t.integer :windows
            t.integer :house_id
            t.integer :hex
            t.belongs_to :user, foreign_key: true
        end
    end
end
