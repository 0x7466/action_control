require 'action_control/controller_methods'
require 'action_control/errors'
require 'action_control/action_controller/base'

module ActionControl
	# Authorizes the user.
	def authorize!
		# Return if the controller
		# is a Devise controller.
		return if defined?(::DeviseController) && is_a?(::DeviseController)

		raise ActionControl::AuthorizationNotPerformedError unless defined?(authorized?)
		
		raise ActionControl::NotAuthorizedError unless send(:authorized?) == true
	end
end
