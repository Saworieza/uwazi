module ApplicationHelper
    #humanize selection options in comments
    def humanize_boolean(boolean)
        I18n.t((!!boolean).to_s)
    end
    
    #login from anywhere in the app
    def resource_name
        :user
    end

    def resource
        @resource ||= User.new
    end

    def devise_mapping
        @devise_mapping ||= Devise.mappings[:user]
    end
end
