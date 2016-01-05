class UserMailer < ApplicationMailer
  include Roadie::Rails::Automatic
  default from: 'notifications@example.com'
  def welcome_email(user)
    @user = user
    @url  = 'http://198.100.30.163/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')

  end
end
