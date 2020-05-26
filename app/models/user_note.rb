class UserNote < ApplicationRecord

  # Associations
  belongs_to :user
  belongs_to :note

end
