class CreateDryingProcesses < ActiveRecord::Migration[5.2]
  def change
    create_table :drying_processes do |t|
      t.string :name
      t.text :process_time
      t.text :description

      t.timestamps
    end
  end
end
