# == Schema Information
#
# Table name: notes
#
#  id          :integer          not null, primary key
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Note < ApplicationRecord

  # Validations
  validates :description, presence: true

  # Associations
  has_many :user_notes, dependent: :destroy
  has_many :users, through: :user_notes

  # find role of user
  def find_role(user_id)
    self.user_notes.where(user_id: user_id).first&.role
  end

end
