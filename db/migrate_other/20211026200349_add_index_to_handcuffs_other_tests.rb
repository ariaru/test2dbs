class AddIndexToHandcuffsOtherTests < ActiveRecord::Migration[6.1]
  phase :post_restart
  disable_ddl_transaction! # Adding an index concurrently must not happen inside a transaction (the default)

  def change
    add_index :handcuffs_primary_tests, :other_test_field, algorithm: :concurrently
end
