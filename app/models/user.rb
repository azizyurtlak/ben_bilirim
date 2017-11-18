class User < ApplicationRecord
  attr_accessor :password_confirmation

  validates_confirmation_of :password, on: :create
  validates :email, presence: true
  validates :password, presence: true
  validates :name, presence: true
end
