# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_vroomclick_session',
  :secret      => '522aabcee4cd64949f3dedc5b85253574896d9b14ebbd5121b219388c6e533d6c53594068b6c6fa052a10b6b8513212e8b221d9913b53c631be68c59ee8af6e4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
