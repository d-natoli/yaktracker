When /^I go to the home page$/ do
  visit root_path
end

Then /^I should see "(.*?)" as the total pool$/ do |amount|
  element = find ".pool h1"
  element.text.should == amount
end
