class User < ActiveRecord::Base
	has_secure_password
	# this gives me 3 new methods
	# getting the password
	# setting the password
end