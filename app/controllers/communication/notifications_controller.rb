module Communication
    class NotificationsController 
        def create 
            user_id = params[:user_id]

            user = User.where(id: user_id).take 


            return render json: { message: 'user is not found'}, status: 422


            send_notification
        end 


        private 


        def validate_post_notification_params 
            params.permit(:channel, :user_id)
        end 


        def send_notification
            
        end 
    end 
end 