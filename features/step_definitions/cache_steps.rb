Given /^I store a value in the cache$/ do
  Rails.cache.write("abc", "123")
  Rails.cache.read("abc").should == "123"
end

When /^I visit the clear cache page$/ do
 visit delete_cache_path
end

Then /^the value shouldn't be stored in the cache anymore$/ do
  Rails.cache.read("abc").should be_nil
end
