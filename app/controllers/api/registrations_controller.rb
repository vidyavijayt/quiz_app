# File to handle user signup
class Api::RegistrationsController < Api::ApiController
  skip_before_action :token_authenticate

  # API for standard sign up
  def signup
    if params.blank? && params[:user].blank?
      # return invalid_response(resp['invalid_api'])
      render json: {
        success: false,
        redirect_to: root_path,
        message: 'Enter login credentials',
      }
    else
      user = User.new(user_params)
      if user.save
        render json: {
          success: true,
          redirect_to: root_path,
          message: 'Signup Success',
          user: user,
        }, status: :ok
      else
        render json: {
          success: false,
          redirect_to: root_path,
          message: user.errors.full_messages,
        }
      end
    end
  end

  private

  # To set user params
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
