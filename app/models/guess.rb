class Guess < ActiveRecord::Base
  acts_as_gmappable process_geocoding: false

  validates :name, :email, :message, presence: true
  validate :location_entered

  after_create :send_new_guess_email

  scope :paid, ->{ where(paid: true) }
  scope :unpaid, ->{ where(paid: false) }

  def display_name
    "#{id} - #{name} - #{email}"
  end

  def update_paid_status
    self.paid = true
    save
    GuessMailer.guess_validated(self).deliver
  end

  private

  def location_entered
    errors[:base] = "Please select a location on the map" unless latitude && longitude
  end

  def send_new_guess_email
    GuessMailer.guess_information(self).deliver
  end
end
