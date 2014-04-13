Rails.application.routes.draw do
  match 'route' => 'samples#index'
  get 'foobar', to 'welcome#index'
end
