module ApplicationHelper
	def get_user_email(user_id)
		user = User.find_by(id: user_id)
		return user.email
	end
end
