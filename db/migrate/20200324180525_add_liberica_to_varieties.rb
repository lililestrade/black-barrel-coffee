class AddLibericaToVarieties < ActiveRecord::Migration[5.2]
  def change
    add_column :varieties, :liberica, :boolean, default: false
  end
end
