class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses, id: :uuid  do |t|
      t.uuid :person_id, index: true
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
