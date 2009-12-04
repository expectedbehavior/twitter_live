Factory.define(:user) do |u|
  u.sequence(:email) { |n| "email#{n}@example.com" }
  u.sequence(:login) { |n| "tweeterer#{n}" }
  u.name { "John Doe" }
  u.password "password"
  u.password_confirmation "password"
  u.activated_at 1.day.ago
  u.state "active"
end

