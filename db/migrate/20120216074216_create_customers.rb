class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone
      t.string :courselocation
      t.string :address
      t.string :city
      t.string :state
      t.string :state
      t.string :zip
      t.string :email
      t.string :instructorsname

      t.timestamps
    end
  end
end
