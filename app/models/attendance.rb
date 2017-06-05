class Attendance < ApplicationRecord
  belongs_to :user

  validates :start, presence: true, on: :application_create
  validates :end, presence: true, on: :application_create

end
