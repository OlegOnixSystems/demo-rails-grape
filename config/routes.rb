Rails.application.routes.draw do
  mount Public::API => '/'
  mount Sessions::APIV1 => '/v1/sessions'
  mount Sessions::APIV2 => '/v2/sessions'
  mount Protected::API => '/protected'
end
