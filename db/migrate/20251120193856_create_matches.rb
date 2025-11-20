class CreateMatches < ActiveRecord::Migration[8.0]
  def change
    create_table :matches do |t|
      t.references :student, null: false, foreign_key: true
      t.references :mentor, null: false, foreign_key: true
      t.integer :score
      t.string :status, default: 'pending'

      t.timestamps
    end

    add_index :matches, [ :student_id, :mentor_id ], unique: true
  end
end
