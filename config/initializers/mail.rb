ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => 'gmail.com',
  :user_name            => '', #TODO insert username
  :password             => '', #TODO insert password
  :authentication       => 'plain',
  :enable_starttls_auto => true  
}
