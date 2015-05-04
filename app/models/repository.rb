class Repository < ActiveRecord::Base

  has_many :settings, dependent: :destroy

  validates :owner_id, presence: true
  validates :name, presence: true
  validates :full_name, presence: true

end
