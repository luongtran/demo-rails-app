class RegistrationsController < Devise::RegistrationsController

    def new
      @user = User.new
      @groups =Group.all
    end

    # GET /users/1/edit
    # POST /users
    # POST /users.json
    def create
      @user = User.new(user_params)

      respond_to do |format|
        if @user.save
          # group=Group.find(1);
           #@user.groups<<group
           #UserMailer.welcome_email().deliver!
           #UserMailer.welcome_email(@user).deliver_later
       
          format.html { redirect_to @user, notice: 'User was successfully created .'}
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

  private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
         params.require(:user).permit(:username, :email,
          :password,:remember_digest,:first_name,:last_name,:title,:company,:avatar)
      end
 def configure_permitted_parameters
     devise_parameter_sanitizer.for(:user_update) do |u|
      u.permit(:first_name, :last_name,
               :password, :password_confirmation, :current_password)
    end
  end


 protected

  def after_sign_up_path_for(resource)
    root_path
  end

  def after_inactive_sign_up_path_for(resource)
    root_path
  end

end