class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.bigint :adult_1_id
      t.bigint :adult_2_id
      t.bigint :adult_3_id
      t.bigint :kid_id

      t.timestamps
    end
  end
end
