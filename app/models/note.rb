class Note < ApplicationRecord

  # Validations
  validates :description, presence: true

end
