namespace :communication do 
    resources :notifications, only:[:create]
    end 
end 