class CreateHouses < ActiveRecord::Migration[5.2]
    def change
        create_table :houses do |t|
            t.string :name
            t.string :hex
            t.float :price
            t.integer :size
            t.integer :user_id
        end
    end
end
