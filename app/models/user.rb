class User < ApplicationRecord
  validates :name, :email, :role, :billing_day, :password, presence: true
  validates :name, length: { minimum: 2 }
  validates :billing_day, :numericality => { only_integer: true, :greater_than => 0, :less_than => 29 }
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }, on: :create
 
  mount_uploader :image, ImageUploader
  has_many :subscriptions
  enum role: [:admin, :user]
  after_initialize :set_default_user_type, :if => :new_record?

  def set_default_user_type
  	self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
