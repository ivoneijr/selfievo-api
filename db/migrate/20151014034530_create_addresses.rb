class CreateAddresses < ActiveRecord::Migration
  def change

    create_table :addresses do |t|
      t.string :street
      t.integer :number
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :zip
      t.string :complement

      t.timestamps null: false
    end
  end
end
