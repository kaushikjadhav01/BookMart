class RegistrationsController < Devise::RegistrationsController
     
    # DELETE /resource
    # Overriding the default Devise destroy action to allow for a custom redirect path
    def destroy
        # authorize is used to authroize page using Pundit policies given in app/policies
        authorize @user
        @user.destroy
    
        respond_to do |format|
          format.html { redirect_to new_user_session_path, notice: "User was successfully destroyed." }
          format.json { head :no_content }
        end
      end
  end