# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_HealthLog_session',
  :secret      => 'e4c2bcd2ba3434ad7514f96262070e442a4e739f2c80d820f9344e4e5db887aa7b5b0d7cd0d099cdc941550cdda73ae5f82f4e561892aae0cdc27f5aa0b2dd85'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
