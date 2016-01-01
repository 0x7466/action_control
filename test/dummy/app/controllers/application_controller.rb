class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	before_action :authorize!

	rescue_from ActionControl::NotAuthorizedError, with: -> { render html: 'You are not authorized!' }
end
