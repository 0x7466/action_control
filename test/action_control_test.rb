require 'test_helper'

class ActionControlTest < ActiveSupport::TestCase
	setup do
		@authorizable = Class.new do
			include ActionControl
		end
	end

	test 'should raise `AuthorizationNotPerformedError` if #authorized? is not defined' do
		assert_raise ActionControl::AuthorizationNotPerformedError do
			@authorizable.new.authorize!
		end
	end

	test 'should raise `NotAuthorizedError` if #authorized? not returns true' do
		@authorizable.class_eval do
			define_method :authorized? do
				false
			end
		end

		assert_raise ActionControl::NotAuthorizedError do
			@authorizable.new.authorize!
		end
	end

	test 'should raise no exception if #authorized? returns true' do
		@authorizable.class_eval do
			define_method :authorized? do
				true
			end
		end

		assert_nothing_raised do
			@authorizable.new.authorize!
		end
	end

	test 'should return if class is a Devise controller' do
		::DeviseController = @authorizable

		assert_nothing_raised do
			::DeviseController.new.authorize!
		end
	end
end
