class Product < ApplicationRecord
  belongs_to :user
  has_many :comments
  include ActionView::RecordIdentifier

  after_create_commit { broadcast_prepend_to [:products], target: "#dom_id_products"}
end
