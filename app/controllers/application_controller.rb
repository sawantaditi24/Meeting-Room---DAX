require "application_responder"
class ApplicationController < ActionController::Base
include Pundit
rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
protect_from_forgery with: :exception


  private

  def user_not_authorized
    flash[:alert] = "Access denied."
    redirect_to (request.referrer || root_path)
  end

  def after_sign_in_path_for(resource)
    bookings_path || root_path
  end


end
