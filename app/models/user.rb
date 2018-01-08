class User < ActiveRecord::Base
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false } , format: { with: EMAIL_REGEX}
  has_many :likes, dependent: :destroy

  before_save :downcase
  # downcase is a method of the user class, so is a symbol(key)

  def downcase
    self.first_name.downcase!
    self.last_name.downcase!
    self.email.downcase!
  end
  
end
