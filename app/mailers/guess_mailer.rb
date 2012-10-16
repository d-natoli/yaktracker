class GuessMailer < ActionMailer::Base
  default from: "yaktracker@gmail.com"

  def guess_information(guess)
    @name = guess.name
    @id = guess.id
    mail :to => [guess.email, "yaktracker@gmail.com"], :subject => "Thanks for your guess on Yaktracker!"
  end

  def guess_validated(guess)
    @name = guess.name
    @id = guess.id
    @betting_pool = "$#{Guess.paid.count * 5}"
    mail :to => [guess.email, "yaktracker@gmail.com"], :subject => "Your guess has been validated on Yaktracker!"
  end
end
