class CreateHandcuffsPrimaryTests < ActiveRecord::Migration[6.1]
  phase :pre_restart

  def change
    create_table :handcuffs_primary_tests do |t|
      t.string :test_field

      t.timestamps
    end
  end
end
