# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_twitter_search_session',
  :secret      => 'b9024f8db1b0a4d662a1548c8d05dc5f0aacb57aed22aafb396b0917dc6808dd0864c7d9d641c359e0db0db32a93215b93eaef68dfdc216e015a9d10c07945ba'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
