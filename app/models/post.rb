# frozen_string_literal: true

class Post < ApplicationRecord
  validates :message, presence: true,
                      length: { minimum: 1 }
  belongs_to :user
  validates :user_id, presence: true

  has_many :comments, dependent: :destroy
end
