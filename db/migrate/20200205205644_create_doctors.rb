class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.belongs_to :city , index: true
      t.string :first_name
      t.string :last_name
      t.string :zip_code

      t.timestamps
    end
  end
end
