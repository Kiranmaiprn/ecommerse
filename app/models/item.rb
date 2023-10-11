class Item < ApplicationRecord
  belongs_to :cart
  validates :price, numericality: true

  has_many :order_details
  has_many :orders, through: :order_details

   after_initialize do
    puts "You have intialized an item"
  end

   after_create do
    puts "you have intialized after create action"
  end
   before_create do
    puts "you have intialized before create action"
  end
  before_save do
     puts "you have called  before save action"
  end
  after_save do
    puts "you have called  after save action"
 end
  before_validation do
    puts "it is before validation action"
  end
  
   after_find do
    puts "you have found an item"
  end

end
