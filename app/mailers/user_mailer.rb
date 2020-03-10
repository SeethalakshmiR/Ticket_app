class UserMailer < ApplicationMailer
  default from: "sabitha.k1999@gmail.com"
  def welcome_email(detail)
     @detail = detail
     mail(to: @detail.email,
          subject: "Receipt for #{@detail.confirm_movie_name}")
  end
end
