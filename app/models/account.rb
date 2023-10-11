class Account < ApplicationRecord
  after_destroy :log_destroy_action
  belongs_to :user

  validates_numericality_of :account_number, only_integer: true, on: :create
  validates_inclusion_of :account_type, :in => %w(savings salary fixed_deposit),
    :message => "{{value}} is not a valid account type", allow_nil: true

  def log_destroy_action
    puts 'Account destroyed'
  end


  def after_initialize
    puts "You have intialized an item"
  end

  def after_find
    puts "you have found an item"
  end
end
