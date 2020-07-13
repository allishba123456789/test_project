class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }
  validates :billing_day, :numericality => { only_integer: true, :greater_than => 0, :less_than => 29 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password,presence: true, length: { minimum: 6 }, on: :create
  has_many :subscriptions

  mount_uploader :image, ImageUploader
  enum role: [:admin, :user]
  after_initialize :set_default_user_type, :if => :new_record?

  def set_default_user_type
    self.role ||= :user
  end

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable


end
