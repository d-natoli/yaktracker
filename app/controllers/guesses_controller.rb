class GuessesController < ApplicationController
  before_filter :generate_map_options

  def new
    @guess = Guess.new
  end

  def create
    @guess = Guess.new(guess_params)

    if @guess.save
      flash[:notice] = "Guess has been recorded! An email has been sent with further instructions."
      redirect_to :controller => "map", :action => "index"
    else
      flash[:error] = "Guess wasn't recorded. Please fix the errors below."
      render :action => "new"
    end
  end

  private

  def guess_params
    params.require(:guess)
  end

  def generate_map_options
    @map_options = {
      "map_options" => {
        "container_class" => "guesses_map map_container",
        "auto_adjust" => "true"
      },
      "direction" => {
        "data" => {
          "from" => Checkpoint.first,
          "to" => Checkpoint.last
        },
        "options" => {
          "waypoints" => Checkpoint.all[1...-1]
        }
      }
    }
  end
end
