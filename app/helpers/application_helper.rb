module ApplicationHelper

    # helper method to represent the current transaction. Initialize a new empty transaction if there is no transaction in session
    def current_transaction
        if !session[:transaction_id].nil?
            Transaction.find(session[:transaction_id])
        else
            Transaction.new
        end
    end

    def alert_class_by_type(alert_type)
        case alert_type.to_sym
        when :alert, :danger, :error, :validation_errors
          'alert-danger'
        when :warning, :todo
          'alert-warning'
        when :notice, :success
          'alert-success'
        else
          'alert-info'
        end
    end
end
