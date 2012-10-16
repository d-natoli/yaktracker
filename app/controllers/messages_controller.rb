class MessagesController < ApplicationController
  before_filter :load_messages

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])

    if @message.save
      redirect_to new_message_path, :notice => "Message created!"
    else
      flash[:error] = "Message not created"
      render 'new'
    end
  end

  private
  def load_messages
    @messages = Message.order("created_at DESC")
  end
end
