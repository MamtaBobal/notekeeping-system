class UserNote < ApplicationRecord

  # Associations
  belongs_to :user
  belongs_to :note

  # Enums
  enum role: [:owner, :contributor, :reader]

end
