class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.text :image_data
      t.string :job_title
      t.string :phone_number
      t.string :contact_email
      t.text :description

      t.timestamps
    end
  end
end