class MessageMailer < ActionMailer::Base
  default from: "yaktracker@gmail.com"

  def new_message(message)
    @author = message.author
    @content = message.content

    mail :to => ["yaktracker@gmail.com"], :subject => "#{@author} sent you a message on Yaktracker!"
  end
end
