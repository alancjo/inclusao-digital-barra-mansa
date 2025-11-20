class CreateSupporters < ActiveRecord::Migration[7.0]
  def change
    create_table :supporters do |t|
      t.string :name, null: false
      t.string :support_type
      t.string :contact_info

      t.timestamps
    end
  end
end
