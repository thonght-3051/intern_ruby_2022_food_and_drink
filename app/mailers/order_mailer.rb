class OrderMailer < ApplicationMailer
  def status order
    @order = order
    mail to: @order.user_email, subject: t("admin.orders.update.mail.subject", status: @order.status_i18n)
  end
end
