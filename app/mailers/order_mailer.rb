class OrderMailer < ApplicationMailer
  default from: 'olegshevtsov1@gmail.com'
  THANKS_ORDER_MESSAGE = I18n.t('order_mailer.thanks_message')

  def send_thanks_email
    @current_order = current_order
    user = @current_order.user
    mail(to: user.email, body: THANKS_ORDER_MESSAGE)
  end
end
