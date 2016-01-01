Rails.application.routes.draw do
	root 'welcome#index'
	get 'other' => 'welcome#other'
end
