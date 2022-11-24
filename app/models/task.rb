class Task < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validate :date_time_is_valid_datetime
  validates :need_help, inclusion: { in: [true, false] }
  validates :category, presence: true
  validates :title, presence: true, length: { minimum: 6, maximum: 50 }
  validates :description, length: { maximum: 1000 }
  validates :address, presence: true

  def date_time_is_valid_datetime
    errors.add(:date_time, 'should be 24 hours or later from now') unless date_time.to_date >= Date.tomorrow
  end
end
