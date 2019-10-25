class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :state
      t.references :contact

      t.timestamps
    end
    add_index :addresses, :contact_id
  end
end
