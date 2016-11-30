class AddCellNumberToSms < ActiveRecord::Migration[5.0]
  def change
    add_column :sms, :Cell_number, :string
  end
end
