class TaskApplication < ApplicationRecord
  belongs_to :user
  belongs_to :task
  has_many :experiences

  validates :status, inclusion: { in: ["open", "accepted", "rejected", "expired"] }
end
