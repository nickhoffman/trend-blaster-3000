# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_HackTO2_session',
  :secret      => '3ffcfe1b9e3ab319811ae25e579ba9b1ad5baa46a0089602fa2188ac52582d511e5a6ddfebe043fb16f567fa0dca93b1df429324ab364a4a27f8f992a717b68f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
