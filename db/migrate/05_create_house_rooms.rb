class CreateHouseRooms < ActiveRecord::Migration[5.2]
    def change
        create_table :house_rooms do |t|
            t.integer :windows
            t.integer :hex
            t.belongs_to :room, foreign_key: true
            t.belongs_to :house, foreign_key: true
        end
    end
end