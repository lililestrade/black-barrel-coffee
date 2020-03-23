class CreateParents < ActiveRecord::Migration[5.2]
  def change
    create_table :parents do |t|
      t.references :variety, foreign_key: true
      t.bigint :parent_variety_id

      t.timestamps
    end
  end
end
