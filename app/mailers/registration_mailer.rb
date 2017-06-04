class RegistrationMailer < ApplicationMailer
 default from: "from@example.com"

 def registration_email(email, registration)
 # def registration_email(email)
   # @user = user
   @registration = registration
   mail to: email, subject: "新規ユーザー登録"
 end
end

