Grapevine::Application.routes.draw do

  scope 'api' do 
    resources :rumors
  end


  root :to => 'main#index'


end
