class Setting < ActiveRecord::Base

  belongs_to :user
  belongs_to :repository

  enum for: [:issues, :pull_requests]

  validates :repository_id, presence: true, uniqueness: {scope: :user_id}

end
