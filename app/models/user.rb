class User < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :user_comments
  before_save { name.downcase! }
  validates :name,  presence: true, length: { maximum: 50, minimum: 1 }, 
             uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
end