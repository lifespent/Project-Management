module ProjectsHelper
    def company_querry(var)
        @company = Company.all :conditions => ['id = ?', var]
        @company.each do |company|
        @company_name = company.name
        @company_id = company.id
        end
    end
end
