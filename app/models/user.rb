class User < ActiveRecord::Base
  after_create :add_cart, :cart

  has_many :carts

  attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :username, presence: true, uniqueness: {case_sensitive: false}
  # validate :validate_username

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 def self.find_for_database_authentication(warden_conditions)
   conditions = warden_conditions.dup
   if login = conditions.delete(:login)
     where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
   else
     where(conditions.to_hash).first
   end
 end

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def add_cart
    #Same as self.cart.create where self is the user instance
    carts.create#(user: self)
  end

  def cart
    Cart.find_by(user: self, is_active: true)
  end
end
