class SessionController < ApplicationController
    def new 
    end

    def create
		user_params = params[:user]
        user = User.find_by(name: user_params[:name])
		#abort params[:user][:name].inspect
		
        if user.present? && user.authenticate(user_params[:password])
            session[:current] = user
            redirect_to "/sucess" #, notice: "You have successfully Logined1"
        else
            flash[:alert] = "Invalid Email or password"
			redirect_to "/sign_up"
        end
    end

    def login
		#render template: "session/dashboard"
        render plain: "Login successfully"
    end
	def destroy
		# deletes user session
		session[:user_id] = nil
		redirect_to root_path, notice: 'Logged Out'
    end	
    
end
