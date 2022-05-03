class SessionController < ApplicationController
    def new 
    end

    def create
        render plain: "You have successfully Signuped"
    end

    def login
        render plain: "You have successfully Logined"
    end
    
end
