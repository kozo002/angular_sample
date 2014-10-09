class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.integer :phone
      t.text :address

      t.timestamps
    end
  end
end
