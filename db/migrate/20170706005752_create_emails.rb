class CreateEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :emails do |t|
      t.string :address
      t.string :emailable_type
      t.integer :emailable_id

      t.timestamps
    end
  end
end
