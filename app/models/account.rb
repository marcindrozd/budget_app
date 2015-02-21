class Account < ActiveRecord::Base
  before_save :add_slug

  belongs_to :user
  has_many :expenses, dependent: :destroy

  validates :total, numericality: { greater_than_or_equal_to: 0.01 }
  validates :currency, presence: :true
  validates :name, uniqueness: { scope: :user }

  def add_slug
    a_slug = prepare_slug(self.user.username + " " + self.name)
    self.slug = a_slug
  end

  def prepare_slug(str)
    str = str.strip.downcase
    str.gsub!(/[ \W]/, ' ' => "-", '\W' => "")
    str
  end

  def to_param
    slug
  end
end