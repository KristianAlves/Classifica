class Backoffice::AdminsController < BackofficeController

  before_action :set_admin, only:[:edit, :update, :destroy]
  after_action :verify_authorized, only: [:new, :destroy]
  after_action :verify_policy_scoped, only: :index

    def index
      #@admins = Admin.with_restricted_access
      @admins = policy_scope(Admin)
    end

    def new
      @admin = Admin.new
      authorize @admin
    end

    def create
      @admin =Admin.new(params_admin)
        if @admin.save
          redirect_to backoffice_admins_path, notice: t('messages.admin.success_register', admin_email: @admin.email )
        else
          render :new
        end
    end

    def edit
    end

    def update
      passwd = params[:admin][:password]
      passwd_confirmation = params[:admin][:password_confirmation]

        if passwd.blank? && passwd_confirmation.blank?
          params[:admin].delete(:password)
          params[:admin].delete(:password_confirmation)
        end

        if @admin.update(params_admin)
          AdminMailer.update_email(current_admin, @admin).deliver_now
          redirect_to backoffice_admins_path, notice: t('messages.admin.success_update', admin_email: @admin.email )
        else
          render :edit
        end
    end

    def destroy
      if @admin.destroy
          redirect_to backoffice_admins_path, notice: t('messages.admin.success_destroy', admin_email: @admin.email )
          authorize @admin
      else
        render :index
      end
    end


  private
      def params_admin

        if @admin.blank?
          params.require(:admin).permit(:name, :email, :role, :password, :password_confirmation)
        else
          params.require(:admin).permit(policy(@admin).permitted_attributes)
        end
      end

    def set_admin
        @admin = Admin.find(params[:id])
    end
end