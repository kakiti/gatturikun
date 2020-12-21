class Client < ApplicationRecord
  with_options presence: true do
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥]+\z/ } do
      validates :last_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :last_name_kana
      validates :first_name_kana
    end
    validates :tel_number, format: { with: /\A\d{1,11}\z/ }
    validates :date
    validates :user_id
  end
    
  validates :prospect_id, numericality: { other_than: 1 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prospect
end
