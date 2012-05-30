Given /^there is a User$/ do
  FactoryGirl.create(:user)
end

Given /^the User has posted the message "(.*?)"$/ do |message_text|
  User.count.should == 1
  FactoryGirl.create(:message, :content => message_text, :user => User.first)
end

When /^I visit the page for the User$/ do
  User.count.should == 1
  visit(user_path(User.first))
end

Then /^I should see "(.*?)"$/ do |text|
  page.should have_content(text)
end

Given /^a User has posted the following messages:$/ do |messages|
  user = FactoryGirl.create(:user)
  messages_attributes = messages.hashes.map do |message_attrs|
    message_attrs.merge({:user => user})
  end
  Message.create!(messages_attributes, :without_protection => true)
end

When /^I search for "(.*?)"$/ do |query|
  visit('/search')
  fill_in('query', :with => query)
  click_button('Search')
end

Then /^the results should be:$/ do |expected_results|
  results = [['content']] + page.all('ol.results li').map do |li|
    [li.text]
  end
  expected_results.diff!(results)
end
