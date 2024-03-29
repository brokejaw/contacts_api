class Contact < ActiveRecord::Base
  validates :name, presence: true
  # validates :email, presence: true, uniqueness: true
  validates :email, uniqueness: { scope: :user_id }
  validates :user_id, presence: true

  belongs_to :owner,
  class_name: "User",
  foreign_key: :user_id,
  primary_key: :id

  has_many :contact_shares,
  class_name: "ContactShare",
  foreign_key: :contact_id,
  primary_key: :id

  has_many :shared_users,
  through: :contact_shares,
  source: :user
end

#add model validations