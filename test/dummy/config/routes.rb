Rails.application.routes.draw do
  get "home/index"

  get "home/about"

  mount Contenteditable::Engine => "/contenteditable"
end
