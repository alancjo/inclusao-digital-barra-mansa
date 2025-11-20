class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :full_name, null: false
      t.string :interests
      t.text :learning_goal
      t.string :availability
      t.string :contact_info
      t.string :proficiency_level

      t.timestamps
    end
  end
end
