class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo
  has_many :tasks
  has_many :task_applications
  has_many :task_applications_as_owner, through: :tasks, source: :task_applications

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
