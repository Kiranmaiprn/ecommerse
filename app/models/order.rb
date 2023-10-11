class Order < ApplicationRecord
  belongs_to :user

  has_many :comments

  has_many :order_details
  has_many :items, through: :order_details

  validates_format_of :card_number, :with => /\A[0-9]+\z/,
    :message => "Only numbers allowed"
  validates_inclusion_of :payment_type, in: %w(card cash)

  validates_presence_of :card_number, if: :paid_with_card

  private
  def paid_with_card
    payment_type=='card'
  end

end
