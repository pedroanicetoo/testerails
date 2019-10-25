class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.references :kind
      t.text :rmk

      t.timestamps
    end
    add_index :contacts, :kind_id
  end
end
