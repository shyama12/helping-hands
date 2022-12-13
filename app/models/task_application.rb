class TaskApplication < ApplicationRecord
  belongs_to :user
  belongs_to :task
  has_many :experiences
  default_scope { order(updated_at: :desc) }
  validates :status, inclusion: { in: ["open", "accepted", "rejected", "expired"] }
end
