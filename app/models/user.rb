class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates_presence_of :name
  validates_length_of :name, minimum: 3
  validate :capitalize_name


  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self


  has_many :notifications, as: :recipient, dependent: :destroy
  has_many :orders, class_name: 'Order'
  has_one :account, dependent: :destroy
  has_one :cart
  validates_associated :cart
  has_one :address
  
  def jwt_payload
    super
  end

  def on_jwt_dispatch(token, payload)
     @auth_token = token
  end
    
  def auth_token
    @auth_token
  end

  def current_user
    @current_user= current_user
  end

  def capitalize_name
    self.name= name.capitalize
  end
end
