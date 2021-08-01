class FeedBackMailer < ApplicationMailer
  ADMIN_EMAIL = 'admin@fcloud.ru'

  def create(message)
    @message = message
    mail to: ADMIN_EMAIL, subject: "Feedback"
  end
end