require 'action_control/controller_methods'
require 'action_control/errors'

module ActionControl
	# Authorizes the user.
	def authorize!(auth_method=:authorized?)
		raise ActionControl::NotAuthorizedError unless send(auth_method) == true
	rescue NoMethodError => e
		raise ActionControl::AuthorizationNotPerformedError if e.name == auth_method
	end
end
