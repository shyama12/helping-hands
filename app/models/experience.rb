class Experience < ApplicationRecord
  belongs_to :task_application

  default_scope { order(updated_at: :desc) }
end
