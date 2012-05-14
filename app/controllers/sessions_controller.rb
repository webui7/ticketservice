class SessionsController < ApplicationController
  def new
  end
  
  def create
     user = User.authenticate(params[:session][:usename], params[:session][:password])                   
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      render 'new'
      #      redirect_to :controller => 'tickets', :action => 'index'
    else
      sign_in user
      redirect_to :controller => 'tickets', :action => 'index'
    end
  end
  
    def destroy
    sign_out
    redirect_to :controller => 'tickets', :action => 'new'
  end
  
  
end
