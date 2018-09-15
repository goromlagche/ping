Rails.application.routes.draw do
  resource :ping, only: :show
end
