class ContactShare < ActiveRecord::Base
  validates :contact_id, presence: true
  validates :user_id, presence: true
  validates :user_id, uniqueness: { scope: :contact_id }

  belongs_to :user
  belongs_to :contact
end