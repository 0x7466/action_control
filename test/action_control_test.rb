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

	test 'should raise `NotAuthorizedError` if #authorized? with argument returns not true' do
		@authorizable.class_eval do
			def authorized?(error); false; end
		end

		assert_raise ActionControl::NotAuthorizedError do
			@authorizable.new.authorize!
		end
	end

	test 'should raise `NotAuthorizedError` if #authorized? with argument and custom error returns not true' do
		@authorizable.class_eval do
			def authorized?(error)
				error[:code] = 'DEMO_CODE'
				error[:message] = 'Demo message'

				false
			end
		end

		begin
			@authorizable.new.authorize!
		rescue ActionControl::NotAuthorizedError => e
			error = e.error

			assert_equal error[:code], 'DEMO_CODE'
			assert_equal error[:message], 'Demo message'
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

	test 'should raise no exception if #authorized? with argument returns true' do
		@authorizable.class_eval do
			def authorized?(error); true; end
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

	test 'should raise `NotAuthenticatedError` if #authenticated? with argument returns not true' do
		@authorizable.class_eval do
			def authenticated?(error); false; end
		end

		assert_raise ActionControl::NotAuthenticatedError do
			@authorizable.new.authenticate!
		end
	end

	test 'should raise `NotAuthenticatedError` if #authenticated? with argument and custom error returns not true' do
		@authorizable.class_eval do
			def authenticated?(error)
				error[:code] = 'DEMO_CODE'
				error[:message] = 'Demo message'

				false
			end
		end

		begin
			@authorizable.new.authenticate!
		rescue ActionControl::NotAuthenticatedError => e
			error = e.error

			assert_equal error[:code], 'DEMO_CODE'
			assert_equal error[:message], 'Demo message'
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

	test 'should raise no exception if #authenticated? with argument returns true' do
		@authorizable.class_eval do
			def authenticated?(error); true; end
		end

		assert_nothing_raised do
			@authorizable.new.authenticate!
		end
	end
end
