class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :amount, default: 0
      t.string :token
      t.string :identifier
      t.string :payer_id
      t.boolean :completed, default: false
      t.boolean :canceled, default: false
      t.belongs_to :user
      t.belongs_to :project

      t.timestamps
    end

    add_index  :payments, :token,      unique: true
    add_index  :payments, :identifier, unique: true
  end
end
