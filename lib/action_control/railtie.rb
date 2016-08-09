module ActionControl
	class Railtie < Rails::Railtie
		initializer 'action_control.insert_into_action_controller' do
			ActiveSupport.on_load :action_controller do
				::ActionController::Base.include(ActionControl)
			end
		end
	end
end