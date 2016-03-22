Rails.application.routes.draw do

  root 'welcome#index'
  # 个人用户
  namespace :user do
    root 'welcome#index'
    resources :articles, only:[:index, :show]
  end

  # 管理员
  namespace :admin do
    root 'welcome#index'
    resources :articles
    resources :article_types
  end

  # 个人用户登录系统
  devise_for :users, path: 'user'
  devise_for :admins,path: 'admin'
end
