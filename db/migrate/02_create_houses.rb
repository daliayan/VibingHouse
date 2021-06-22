class CreateHouses < ActiveRecord::Migration[5.2]
    def change
        create_table :houses do |t|
            t.string :name
            t.integer :hex
            t.float :price
            t.integer :size
        end
    end
end
