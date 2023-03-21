class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product
include ActionView::RecordIdentifier

  after_create_commit { broadcast_prepend_to [product, :comments], target: "#{dom_id(product)}_comments"}


end
