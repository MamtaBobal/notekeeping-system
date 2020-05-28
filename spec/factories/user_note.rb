FactoryBot.define do
  factory :user_note do
    role                                  { UserNote::roles.invert[0] }
    user
    note
  end
end
