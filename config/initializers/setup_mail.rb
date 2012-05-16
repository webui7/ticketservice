ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "webui7@gmail.com",
  :password             => "XXXXXXXXXXXXXXX",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
