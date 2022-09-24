class GroupUser < ApplicationRecord
  belongs_to :user
  belongs_to :group
  enum status: {panding: 0, participating: 1, rejecting: 2}
end
