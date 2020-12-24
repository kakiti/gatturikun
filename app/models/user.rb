class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :name
    validates :phone_number, format: { with: /\A\d{1,11}\z/ }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  end
  validates :position_id, numericality: { other_than: 1 }

  has_many :clients
  has_many :tasks, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :position
end
