class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :addresstwo
      t.string :city
      t.string :state
      t.string :postalcode
      t.string :website
      t.text :notes

      t.timestamps
    end
  end
end
