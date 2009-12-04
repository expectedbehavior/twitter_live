def login_user_with_default_password(user)
  password = user.password
  password ||= "password"
  @recent_user = user
  Then "I view the login page"
  And "I fill in \"Login\" with \"#{user.login}\""
  And "I fill in \"Password\" with \"#{password}\""
  And "I press \"Log in\""
  And "I should see \"Login successful!\""
end

Given /^I (am logged|log) in as "([^\"]*)"$/ do |x, name|
  @users ||= {}
  
  user = User.find_by_name(name)
  user ||= Factory.create(:user, :name => name)
  @users[name] = user

  login_user_with_default_password(@users[name])
end
