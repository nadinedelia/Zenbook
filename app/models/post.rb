class Post < ApplicationRecord
    validates :message, presence: true
    # belongs_to :user

    default_scope {order(created_at: :desc)}
    # default setting order for created_at column, newest item first
end
