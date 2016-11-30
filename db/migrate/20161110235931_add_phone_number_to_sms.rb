class AddPhoneNumberToSms < ActiveRecord::Migration[5.0]
  def change
    add_column :sms, :Phone_number, :integer
  end
end
