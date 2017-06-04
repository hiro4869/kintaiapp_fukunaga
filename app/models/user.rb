class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   validates :email, presence: true, on: :update
   validates :name, presence: true, on: :update
   validates :birth, presence: true, on: :update
   validates :sex, presence: true, on: :update
   validates :status, presence: true, on: :update
   validates :address, presence: true, on: :update
   validates :phone, presence: true, on: :update
 
   #上記のバリデーションをまとめた書き方
   # with_options on: [ :update ] do |update|
   #   update.validates :email, presence: true
   #   update.validates :name, presence: true
   #   update.validates :birth, presence: true
   #   update.validates :sex, presence: true
   #   update.validates :status, presence: true
   #   update.validates :address, presence: true
   #   update.validates :phone, presence: true
   # end
 

end
