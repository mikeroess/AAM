Ann::Application.routes.draw do
  root 'pages#index'

  get 'resume', to: 'pages#resume', as: :resume
  get 'contact', to: 'pages#contact', as: :contact
  get 'contact/success', to: 'pages#contact_success'
  get 'about', to: 'pages#about', as: :about
  get 'making-of-video', to: 'pages#bofvideo', as: :bofvideo
  get 'aau-audio', to: 'pages#aauaudio', as: :aauaudio
  get 'error', to: 'pages#error', as: :error

  get 'criticism', to: 'criticisms#index', as: :criticisms
  get 'criticism/:id', to: 'criticisms#show', as: :criticism, constraints: { id: /\d+/ }

  get 'jewelry(/:page)', to: 'jewelry#index', as: :jewelry, defaults: { page: 1 }

  get '/:gallery', to: 'galleries#index', as: :gallery
  get '/:gallery/statement', to: 'galleries#statement', as: :gallery_statement
  get '/:gallery/:id', to: 'galleries#show', as: :gallery_image, constraints: { id: /\d+/ }

  post '/ajax/gallery-loupe-notice', to: 'galleries#dismiss_loupe_notice', as: :dismiss_loupe_notice
end
