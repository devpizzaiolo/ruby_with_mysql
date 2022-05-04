class RegistrationsController < ApplicationController
    def new
        @user = User.new
    end
    def create
        @user= User.new(user_params)
        if @user.save
			flash[:alert] = "User register successfully"
            redirect_to "/sign_up"
        else
            flash[:alert]= "Something went wrong"
            render :new
        end
    end
    private
    def user_params
        params.require(:user).permit(:name,:password)
    end
end
