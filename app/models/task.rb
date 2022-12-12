class Task < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :task_applications
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validate :date_time_is_valid_datetime
  validates :need_help, inclusion: { in: [true, false] }
  validates :category, presence: true
  validates :title, presence: true, length: { minimum: 6, maximum: 70 }
  validates :description, length: { maximum: 1000 }
  # validates :address, presence: true
  default_scope { where('date_time > ?', DateTime.now ) }
  scope :is_available_for_application, -> { where(available: true) }
  def date_time_is_valid_datetime
    errors.add(:date_time, 'should be 24 hours or later from now') unless date_time.to_date >= Date.tomorrow
  end
end
