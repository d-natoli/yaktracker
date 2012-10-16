class ValidateGuessController < ApplicationController
  before_filter :load_guesses

  def edit
  end

  def update
    @guess = Guess.find(params[:guess_id])
    
    if password_valid?
      @guess.update_paid_status
      redirect_to validate_guess_path, :notice => "Guess now valid!"
    else
      flash[:error] = "Incorrect password"
      render :action => "edit"
    end
  end

  private
  def load_guesses
    @guesses = Guess.unpaid
  end

  def password_valid?
    params[:password] == "yaktracker2012"
  end
end
