class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people, id: :uuid  do |t|
      t.string :name
      t.string :last_name
      t.date :birth_date
      t.string :registry
      t.string :sex
      t.string :phone
      t.string :type
      t.uuid :address_id, index: true

      t.timestamps null: false
    end
  end
end
