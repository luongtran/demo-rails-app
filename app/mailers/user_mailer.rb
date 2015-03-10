
class ApplicationMailer < ActionMailer::Base

  default from: "vnduongit@gmail.com"
  layout 'email'
end
 
# app/mailers/user_mailer.rb
class UserMailer < ApplicationMailer
 default from: 'notifications@example.com'
 #after_action :set_delivery_options,
  #             :prevent_delivery_to_guests,
   #            :set_business_headers

  def welcome_email()
    mail(#to: user.email,
    	to: "saobang1138@gmail.com",
         body: "welcome_the _world !",
         subject: "Please see the Ter",
         content_type: "text/html",
         subject: "Already rendered!")
  end

  def feedback_message(business, user)
    @business = business
    @user = user
    mail
  end
 
  def campaign_message(business, user)
    @business = business
    @user = user
  end
  
 private
 
    def set_delivery_options
      # You have access to the mail instance,
      # @business and @user instance variables here
      if @business && @business.has_smtp_settings?
        mail.delivery_method.settings.merge!(@business.smtp_settings)
      end
    end
 
    def prevent_delivery_to_guests
      if @user && @user.guest?
        mail.perform_deliveries = false
      end
    end
 
    def set_business_headers
      if @business
        headers["X-SMTPAPI-CATEGORY"] = @business.code
      end
    end


 end
  
  class AdminMailer < ActionMailer::Base
  default to: Proc.new { Admin.pluck(:email) },
          from: 'notification@example.com'
 
  def new_registration(user)
    @user = user
    mail(subject: "New User Signup: #{@user.email}")
  end
end

