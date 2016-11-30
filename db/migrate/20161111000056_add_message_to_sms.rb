class AddMessageToSms < ActiveRecord::Migration[5.0]
  def change
    add_column :sms, :Message, :string
  end
end
