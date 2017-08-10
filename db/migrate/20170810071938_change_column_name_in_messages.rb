class ChangeColumnNameInMessages < ActiveRecord::Migration[5.1]
  def change
   rename_column :messages, :recipient, :recipient_id 
  end
end
