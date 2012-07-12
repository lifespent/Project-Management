module CompaniesHelper
  def project_querry(var)
     @total = Project.count :all, :conditions => ['company_id = ?', var]	
  end
  
end
