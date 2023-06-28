class User < ApplicationRecord
  has_many :subscriptions
  has_many :collections
  has_many :collection_records, through: :collections
  has_many :orders

  enum role: %i[customer driver admin]

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable
end
