class CreatePhones < ActiveRecord::Migration[5.1]
  def change
    create_table :phones do |t|
      t.string :number
      t.string :callable_type
      t.integer :callable_id

      t.timestamps
    end
  end
end
