require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase

	test 'controller has a #authorize! method' do
		assert defined?(@controller.authorize!)
	end

end
