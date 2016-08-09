require 'action_control/controller_methods'
require 'action_control/errors'

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
		
		# If the authorized? method does not return true
		# it raises the ActionControl::NotAuthorizedError
		#
		# Use the .rescue_from method from ActionController::Base
		# to recognize the exception raise and show the user
		# an error message.
		raise ActionControl::NotAuthorizedError unless authorized? == true
	end
end

# Load action control railtie
require 'action_control/railtie'
