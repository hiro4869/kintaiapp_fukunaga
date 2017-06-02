class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true
  validates :name, presence: true
  validates :birth, presence: true
  validates :sex, presence: true
  validates :status, presence: true
  validates :address, presence: true
  validates :phone, presence: true

end
