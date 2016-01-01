class WelcomeController < ApplicationController
	def index
	end

	def other
	end

	def authorized?
		return true if action_name == 'index'
		return false if action_name == 'other'
	end
end
