class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :number
      t.integer :accountnumber
      t.string :taxnumber

      t.timestamps null: false
    end
  end
end
