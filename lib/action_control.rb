require 'action_control/controller_methods'
require 'action_control/errors'
require 'action_control/action_controller/base'

module ActionControl
	# Authorizes the user.
	def authorize!
		raise ActionControl::AuthorizationNotPerformedError unless defined?(authorized?)
		
		raise ActionControl::NotAuthorizedError unless send(:authorized?) == true
	end
end
