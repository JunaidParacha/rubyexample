class Shoe < ActiveRecord::Base
  belongs_to :user
  has_one :sales, dependent: :destroy
  has_one :purchases, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true
end
