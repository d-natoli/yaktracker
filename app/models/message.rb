class Message < ActiveRecord::Base
  attr_accessible :author, :content

  validates :author, :content, :presence => true

  after_create :send_new_message_email

  def date
    self.created_at.strftime "%B %e at %l:%M%P"
  end

  private
  def send_new_message_email
    MessageMailer.new_message(self).deliver
  end
end
