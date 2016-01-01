# @author Tobias Feistmantl
#
# Add Action Control to
# ActionController::Base
# automatically.
ActionController::Base.class_eval do
	include ActionControl
end