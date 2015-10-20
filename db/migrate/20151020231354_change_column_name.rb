class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :questions, :question, :title
  end
end
