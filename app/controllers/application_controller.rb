class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        if resource.is_a?(User)
            user_path(resource)
        elsif resource.is_a?(Admin)
            admin_root_path
        end
    end

    def after_sign_out_path_for(resource)
        root_path
    end
end
