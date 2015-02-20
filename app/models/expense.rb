class Expense < ActiveRecord::Base
  belongs_to :account
  belongs_to :month

  validates :amount, numericality: { greater_than_or_equal_to: 0.01 }
  validates :name, presence: true
end