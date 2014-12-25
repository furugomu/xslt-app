Rails.application.routes.draw do
  with_options defaults: {format: 'xml'} do |xml|
    xml.root 'unkos#index'
    xml.resources :unkos
  end
end
