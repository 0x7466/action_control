require 'action_control/controller_methods'
require 'action_control/errors'

module ActionControl
	# Authorizes the user.
	def authorize!
		# Raise an error if the #authorize? action isn't defined.
		#
		# This ensures that you actually do authorization in your controller. 
		raise ActionControl::AuthorizationNotPerformedError unless defined?(authorized?)
		
		error = {}
		is_authorized = nil

		if method(:authorized?).arity > 0
			is_authorized = authorized?(error)
		else
			is_authorized = authorized?
		end

		# If the authorized? method does not return true
		# it raises the ActionControl::NotAuthorizedError
		#
		# Use the .rescue_from method from ActionController::Base
		# to catch the exception and show the user a proper error message.
		raise ActionControl::NotAuthorizedError.new(error) unless is_authorized == true
	end

	# Authenticates the user
	def authenticate!
		# Raise an error if the #authenticate? action isn't defined.
		#
		# This ensures that you actually do authentication in your controller.
		raise ActionControl::AuthenticationNotPerformedError unless defined?(authenticated?)
		
		error = {}
		is_authenticated = nil

		if method(:authenticated?).arity > 0
			is_authenticated = authenticated?(error)
		else
			is_authenticated = authenticated?
		end
		
		# If the authenticated? method returns not true
		# it raises the ActionControl::NotAuthenticatedError.
		#
		# Use the .rescue_from method from ActionController::Base
		# to catch the exception and show the user a proper error message.
		raise ActionControl::NotAuthenticatedError.new(error) unless is_authenticated == true
	end
end

# Load action control railtie
require 'action_control/railtie'
