class Even < ActiveRecord::Base
  belongs_to :user
  has_many :joins, dependent: :destroy
  has_many :comments, dependent: :destroy
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :Last_name, :location, presence: true, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  before_save do
    self.email.downcase!
  end
end
