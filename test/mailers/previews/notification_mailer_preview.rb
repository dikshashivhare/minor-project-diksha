# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/admin_notification
  def admin_notification
    NotificationMailer.admin_notification
  end

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/employeer_notification
  def employeer_notification
    NotificationMailer.employeer_notification
  end

end
