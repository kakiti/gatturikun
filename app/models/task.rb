class Task < ApplicationRecord
  with_options presence: true do
    validates :content
    validates :user_id
  end
  belongs_to :user
end
