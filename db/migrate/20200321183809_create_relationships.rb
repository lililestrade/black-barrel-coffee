class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.bigint :adult_1_id, null: false
      t.bigint :adult_2_id, default: ""
      t.bigint :adult_3_id, default: ""
      t.bigint :kid_id, null: false

      t.timestamps
    end
  end
end
