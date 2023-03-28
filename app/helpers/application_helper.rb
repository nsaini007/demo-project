module ApplicationHelper
    def recruiter?
        if current_user.type == "Recruiter"
            true
        else
            false
        end
    end

    def applicant?
        if current_user.type == "Applicant"
            true
        else
            false
        end
    end    
end
