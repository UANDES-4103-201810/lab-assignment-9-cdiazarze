class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street
      t.boolean :apartment
      t.string :description
      t.string :zipcode
      t.references :movie, foreign_key: true
      t.timestamps
    end
  end
end
