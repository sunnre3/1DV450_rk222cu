# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
WebApi::Application.config.secret_key_base = '6a596c615692a450764198a66951034949f0ef40737e599f3f426cb22d9c3ba54791e0dbfb6b97d70861b060477152b161afeb158557ebab5792e6633f264a0b'
