require 'action_control/controller_methods'
require 'action_control/errors'
require 'action_control/action_controller/base'

module ActionControl
	# Authorizes the user.
	def authorize!
		# Return if the controller
		# is a Devise controller.
		return if defined?(::DeviseController) && is_a?(::DeviseController)

		# Raise an error if the #authorize? action isn't defined.
		#
		# This ensures that you actually do authorization in your controller. 
		raise ActionControl::AuthorizationNotPerformedError unless defined?(authorized?)
		
		raise ActionControl::NotAuthorizedError unless authorized? == true
	end
end
