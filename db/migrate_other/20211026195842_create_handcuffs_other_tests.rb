class CreateHandcuffsOtherTests < ActiveRecord::Migration[6.1]
  phase :pre_restart

  def change
    create_table :handcuffs_other_tests do |t|
      t.string :other_test_field

      t.timestamps
    end
  end
end
