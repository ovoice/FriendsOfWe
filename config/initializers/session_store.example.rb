# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_FriendsOfWe_session',
  :secret      => '72bd929cfd15cae37748418a650d6af4cc646949cf8eceb2bf18fc9956bfc82bd1814306335asdf80d079196d7f6c2710fe866993d2ba8ebbe1046d53df6e5508963'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
