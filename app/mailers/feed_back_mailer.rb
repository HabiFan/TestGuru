class FeedBackMailer < ApplicationMailer
  ADMIN_EMAIL = 'test.guru122@gmail.com'

  def create(message)
    @message = message
    mail to: ADMIN_EMAIL, subject: "Feedback"
  end
end