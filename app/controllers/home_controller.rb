class HomeController < ApplicationController
  skip_before_action :authenticate_tenant!, :only => [ :index ]
  @tenant instance variable:

  @projects = Project.by_plan_and_tenant(@tenant.id)

  def index
    if current_user
      if session[:tenant_id] 
        Tenant.set_current_tenant session[:tenant_id]
      else
        Tenant.set_current_tenant current_user.tenants.first
      end
      @tenant = Tenant.current_tenant
      params[:tenant_id] = @tenant.id
    end
  end
end
