require 'test_helper'

class ActionControlTest < ActiveSupport::TestCase
	def reinstatiate
		@authorizable = Class.new do
			include ActionControl
		end
	end

	setup do
		reinstatiate
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
end
