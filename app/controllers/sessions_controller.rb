class SessionsController < ApplicationController
   def new
   end

  def create
    user = User.where(email: params[:session][:email].downcase).first
    if user
      #&& user.authenticated(params[:session][:password])
            # Log the user in and redirect to the user's show page.
      log_in user
      params[:session][:remember_me] == '1'? remember(user) : forget(user)
      redirect_to root_url
      #redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!      
      render 'new'
    end
  end

   def destroy
     log_out if logged_in?
     redirect_to root_url
     end

 # private
 # def require_no_authentication
 #   if current_user
 #     sign_out current_user
 #     redirect_to_sign_in(User)
 #   elsif current_user
 #     redirect_to root_url, alert: I18n.t('devise.failure.already_authenticated')
 #   end
 #end
 end
