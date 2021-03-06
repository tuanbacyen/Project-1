Rails.application.routes.draw do
  scope "(:locale)", :locale => /en|vi/ do
    mount Ckeditor::Engine => '/ckeditor'
    root "show_product#show"
    get "session/new"
    get "news", to: "show_news#show", as: "news"
    get "news/:id", to: "show_news#detail", as: "newd"

    resources :users
    get "/users", to: "users#index"
    get "/signup", to: "users#new"
    get "/showu", to: "users#show", as: "showu"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"

    resources :products
    get "show", to: "show_product#show", as: "showp"
    get "show/:id", to: "show_product#detail", as: "detailp"
    post "show/:id", to: "show_product#detail", as: "reply"
    get "cart/", to: "show_product#cart", as: "listcart"
    post "cart/", to: "show_product#destroy", as: "destroycart"
    post "postcomment/", to: "show_product#postcomment", as: "postcmt"
    post "checkout/", to: "show_product#checkout", as: "checkout"
    post "up/", to: "show_product#upcount", as: "upcount"
    post "dow/", to: "show_product#dowcount", as: "dowcount"
    get "clear/", to: "show_product#clearall", as: "clearall"
    get "hisp/", to: "show_product#hisp", as: "hisp"


    namespace :admin do
      resources :searchs
      resources :products
      resources :news
      resources :trademarks
      get "/admin/news/new", to: "admin/news#new", as: "newn"
      root "products#index"
    end
  end
end
