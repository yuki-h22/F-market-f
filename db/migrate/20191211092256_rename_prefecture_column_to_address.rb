class RenamePrefectureColumnToAddress < ActiveRecord::Migration[5.2]
  def change
    rename_column :Addresses, :prefecture_id, :prefecture
  end
end
