Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'test/test', as: 'test'
  get 'test/post_test', to: 'test#post_test_get', as: 'post_test_get'
  post 'test/post_test', to: 'test#post_test_post', as: 'post_test_post'
  patch 'test/post_test', to: 'test#post_test_patch', as: 'post_test_patch'
end
