Rails.application.routes.draw do

  root 'welcome#index'

  # 个人用户
  namespace :user do
    root 'welcome#index'
  end

  # 管理员
  namespace :admin do
    root 'welcome#index'
  end

  # 个人用户登录系统
  devise_for :users, path: 'user'
  devise_for :admins,path: 'admin'
end
