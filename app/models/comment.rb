class Comment < ApplicationRecord
  # bodyが必須項目
  belongs_to :my_thread
  validates :body, presence: true
end
