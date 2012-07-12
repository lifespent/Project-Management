class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  protect_from_forgery
  def owner?(company_id)
    if current_user.admin == "1"
        return true
    else
        @companies = Company.find :all, :conditions => ['user_id = ?', current_user.id]
          @companies.each do |company|
              return true if company.id == company_id
          end 
    end
  end
  def project_owner?(project_id)
    if current_user.admin == "1"
        return true
    else
        @companies = Company.find :all, :conditions => ['user_id = ?', current_user.id]
          @companies.each do |company|
            @projects = Project.find :all, :conditions => ['company_id = ?', company.id]
              @projects.each do |project|
                return true if project.id == project_id
              end
          end 
    end
  end
  
end
