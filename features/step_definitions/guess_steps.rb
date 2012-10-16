Given /^I am on the new guess screen$/ do
  visit new_guess_path
end

Given /^I submit a valid guess$/ do
  fill_in "guess_name", :with => "Steve"
  fill_in "guess_email", :with => "steve@gmail.com"
  fill_in "guess_message", :with => "You are going to die here!"
  find("#guess_latitude").set "48.864900958816754"
  find("#guess_longitude").set "84.32683999999995"
  click_button 'Create Guess'
end

Then /^I should see the guess created message$/ do
  element = find ".notice"
  element.text.should == "Guess has been recorded! An email has been sent with further instructions."
end

Given /^I submit an invalid guess$/ do
  click_button 'Create Guess'
end

Then /^I should see the guess failed message$/ do
  element = find ".error"
  element.text.should == "Guess wasn't recorded. Please fix the errors below."
end

Then /^I should see the errors for that guess$/ do
  element = find ".errors"
  element.should_not be_nil
end

Given /^there are the following guesses:$/ do |table|
  table.hashes.each do |attr|
    guess =Guess.new(:name => attr["name"], :email => attr["email"], :message => attr["message"], :latitude => attr["latitude"], :longitude => attr["longitude"] )
    guess.paid = attr["paid"] == "true" if attr.has_key?("paid")
    guess.save
  end
end

Given /^I am on the validate guess page$/ do
  visit validate_guess_path
end

Given /^I set a guess to validated$/ do
  find("#guess_id").set Guess.first.display_name
  fill_in "password", :with => "yaktracker2012"
  click_button "Validate"
end

Then /^I should see that the guess is now valid$/ do
  element = find ".notice"
  element.text.should == "Guess now valid!"
end

When /^I attempt to set a guess to validated with the wrong password$/ do
  find("#guess_id").set Guess.first.display_name
  fill_in "password", :with => "yaktracker2011"
  click_button "Validate"
end

Then /^I should see the wrong password message$/ do
  element = find ".error"
  element.text.should == "Incorrect password"
end
