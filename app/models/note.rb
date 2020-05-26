class Note < ApplicationRecord

  # Validations
  validates :description, presence: true

  # Associations
  has_many :user_notes
  has_many :users, through: :user_notes

end
