# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_twitter_live_session',
  :secret      => '80fbe612b78e174e6bcb9d25001d806524e9be40a2d452ecca09b6443e5828354af834c550be8b9c8fef7190aed397578d2c8a88d036ef9d3fdbbb73d7d3753a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
