class Comment < ApplicationRecord
  has_many :prototypes
  belongs_to :user

  validates :text, presence: true
end
