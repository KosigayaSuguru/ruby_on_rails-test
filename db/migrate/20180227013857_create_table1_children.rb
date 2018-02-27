class CreateTable1Children < ActiveRecord::Migration[5.1]
  def change
    create_table :table1_children do |t|
      t.string :col1
      t.references :table1, foreign_key: true

      t.timestamps
    end
  end
end
