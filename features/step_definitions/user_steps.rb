When /^I view the homepage of "([^\"]*)"$/ do |login|
  $browser.goto @host + url_for([User.find_by_login(login), :tweets])
  assert_successful_response
end
