class CreateMentors < ActiveRecord::Migration[7.0]
  def change
    create_table :mentors do |t|
      t.string :full_name, null: false
      t.string :expertise, null: false
      t.text :bio
      t.string :availability
      t.string :contact_info

      t.timestamps
    end
  end
end
