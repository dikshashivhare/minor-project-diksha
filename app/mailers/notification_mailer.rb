class NotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.admin_notification.subject
  #
  def admin_notification(admin)
    @admin = admin
    @greeting = "Hi #{@admin.email}"
   
    mail(to: @admin.email, subject: "Employeer Registration Notification Mailer")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.employeer_notification.subject
  #
  def employeer_notification(employeer)
    @employeer = employeer
    @greeting = "Hi #{@employeer.full_name}"
   
    mail(to: @employeer.email, subject: "Registration Successful")
  end
end
