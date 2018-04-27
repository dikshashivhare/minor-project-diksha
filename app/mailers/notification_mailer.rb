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

  def notification_to_employeer_for_job_application(job_seeker, employeer, job) 
    @job_seeker  = job_seeker
    @employeer = employeer
    @job = job
    if job_seeker.resume.present? 
      attachments[File.basename(job_seeker.resume.to_s)] = File.read(Rails.root.to_s+ "/public"+job_seeker.resume_url.to_s)
    end
    mail(to: @employeer.email, subject: "Job Application Recieved for #{job.job_title}")

  end

  def notification_to_job_seeker_for_job_application(job_seeker, job)
    @job_seeker  = job_seeker
    @job = job
    mail(to: @job_seeker.email, subject: "Job Application Submitted Successfully for #{job.job_title}")
  end

  def job_acceptance_notification_to_job_seeker(job_seeker_job)
    @job_seeker = job_seeker_job.job_seeker
    @job = job_seeker_job.job
    mail(to: @job_seeker.email, subject: "Congratulation #{@job_seeker.name} for application acceptance")
  end

end
