# == Schema Information
#
# Table name: user_notes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  note_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  role       :integer
#
class UserNote < ApplicationRecord

  # Associations
  belongs_to :user
  belongs_to :note

  # Enums
  enum role: [:owner, :contributor, :reader]

end
