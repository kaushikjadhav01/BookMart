class Users::SessionsController < Devise::SessionsController
  # DELETE /resource/sign_out
  def destroy
    super do
      # Turbo requires redirects be :see_other (303), which breaks in Rails 7; so override Devise default (302) to support logout in Rails 7
      return redirect_to new_user_session_path, status: :see_other, notice: I18n.t("devise.sessions.signed_out")
    end
  end
end
