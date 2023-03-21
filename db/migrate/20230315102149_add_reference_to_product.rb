class AddReferenceToProduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :products,:user,foreign_keys: true
  end
end
