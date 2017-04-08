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

	test 'should raise `NotAuthorizedError` if #authorized? returns not true' do
		@authorizable.class_eval do
			def authorized?; false; end
		end

		assert_raise ActionControl::NotAuthorizedError do
			@authorizable.new.authorize!
		end
	end

	test 'should raise no exception if #authorized? returns true' do
		@authorizable.class_eval do
			def authorized?; true; end
		end

		assert_nothing_raised do
			@authorizable.new.authorize!
		end
	end


	test 'should raise `AuthenticationNotPerformedError` if #authenticated? is not defined' do
		assert_raise ActionControl::AuthenticationNotPerformedError do
			@authorizable.new.authenticate!
		end
	end

	test 'should raise `NotAuthenticatedError` if #authenticated? returns not true' do
		@authorizable.class_eval do
			def authenticated?; false; end
		end

		assert_raise ActionControl::NotAuthenticatedError do
			@authorizable.new.authenticate!
		end
	end

	test 'should raise no exception if #authenticated? returns true' do
		@authorizable.class_eval do
			def authenticated?; true; end
		end

		assert_nothing_raised do
			@authorizable.new.authenticate!
		end
	end
end
