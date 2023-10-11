class Cart < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :items
  after_touch do
    puts "you have touched an object"
  end
  after_save_commit :log_cart_saved_to_db

  private
  def log_cart_saved_to_db
     puts 'User cart is saved to database'
  end
end
