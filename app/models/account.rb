class Account < ActiveRecord::Base
  belongs_to :user
  has_many :expenses, dependent: :destroy

  validates :total, numericality: { greater_than_or_equal_to: 0.01 }
  validates :currency, presence: :true
end