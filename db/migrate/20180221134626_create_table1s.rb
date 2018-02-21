class CreateTable1s < ActiveRecord::Migration[5.1]
  def change
    create_table :table1s do |t|
      t.string :col1
      t.string :col2

      t.timestamps
    end
  end
end
