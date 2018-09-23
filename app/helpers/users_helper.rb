module UsersHelper

    def job_title_icon
        if @user.company.job_title == "Developer"
            "<i class='fas fa-code'></i>".html_safe
        elsif @user.company.job_title == "Entrepreneur"
            "<i class='fa fa-drafting-compass'></i>".html_safe
        elsif @user.company.job_title == "Investor"
            "<i class='fas fa-donate'></i>".html_safe
        end    
    end
end