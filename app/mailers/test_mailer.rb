class TestMailer < ApplicationMailer
    def order_notification
        @user = params[:user]
        mail to: @user.email,
        subject: "new user notification",
        body: "These are user details:
    name: #{@user.name},
    email: #{@user.email}"
    end
end
