# To deliver this notification:
#
# OrderNotification.with(post: @post).deliver_later(current_user)
# OrderNotification.with(post: @post).deliver(current_user)

class OrderNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  deliver_by :email, mailer: "TestMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  param :user

  # Define helper methods to make rendering easier.
  #
  def message
    t(".message")
  end
  
  def url
    post_path(params[:post])
  end
end
