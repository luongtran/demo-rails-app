class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  include SessionsHelper
  include UsersHelper
  
  helper_method :current_order
  #before_action :authenticate_user!
  before_action :load_categories
  def current_order
  	if session[:order_id].present?
      Order.find(session[:order_id])
  	else
  	  Order.new  	
    end
 
  end
private
def load_categories
  @categories = Category.all()
end


end
