module Api
  #
  # Controller for Sessions related acions
  #
  # @author [sreeraj s]
  #
  class SessionsController < Devise::SessionsController
    skip_before_action :verify_authenticity_token
    protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/quiz.v1' }

    # Sign In
    # POST /api/login
    # Parameters: email, password
    def create
      store_location_for(:resource, params[:ref]) if params[:ref].present?
      resource = warden.authenticate!(
        scope: resource_name,
        recall: "#{controller_path}#failure"
      )
      if resource
        return sign_in_and_redirect(resource_name, resource)
      else
        sign_out
        render json: {
          success: false,
          message: t('devise.sessions.inactive_account')
        }
      end
    end

    # Sign out
    # DELETE /api/logout
    def destroy
      warden.authenticate!(
        scope: resource_name,
        recall: "#{controller_path}#failure"
      )
      sign_out
      render json: {
        success: true,
        message: t('devise.sessions.signed_out'),
        csrfParam: request_forgery_protection_token,
        csrfToken: form_authenticity_token
      }, status: :ok
    end

    # Failure
    def failure
      render json: {
        success: false,
        message: 'Invalid login credentials'
      }
    end

    # Logged in user
    # GET /apis/logged_in_user
    def logged_in_user
      warden.authenticate!(
        scope: resource_name,
        recall: "#{controller_path}#failure"
      )
      render json: {
        success: true,
        message: 'Logged in user',
        user: current_user
      }, status: :ok
    end

    # To handle signin and redirection.
    def sign_in_and_redirect(resource_or_scope, resource = nil)
      scope = Devise::Mapping.find_scope!(resource_or_scope)
      resource ||= resource_or_scope
      sign_in(scope, resource) unless warden.user(scope) == resource
      render json: {
        success: true,
        redirect_to: root_path,
        message: t('devise.sessions.signed_in'),
        user: current_user
      }, status: :ok
    end
  end
end
