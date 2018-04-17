class MyThread < ApplicationRecord
  has_many :comments
  # validation
  validates :title, presence: true
  validates :body, presence: true
end
