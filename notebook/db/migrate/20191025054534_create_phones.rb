class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :phone
      t.references :contact

      t.timestamps
    end
    add_index :phones, :contact_id
  end
end
