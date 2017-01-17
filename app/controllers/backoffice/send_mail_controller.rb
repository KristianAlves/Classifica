class Backoffice::SendMailController < ApplicationController
    def edit
        @admin = Admin.find(params[:id])
        respond_to do |format|
            format.js
        end
    end

    def create
        begin
            AdminMailer.send_message(current_admin, params[:'recipient-text'], params[:'subject-text'], params[:'message-text']).deliver_now
                @notify_message = t('activerecord.modal.send_success')
                @notify_flag = "success"
        rescue
            @notify_message = t('activerecord.modal.send_failed')
            @notify_flag = "error"
        end
        respond_to do |format|
            format.js
        end
    end
end
