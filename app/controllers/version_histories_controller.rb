class VersionHistoriesController < ApplicationController
  before_filter :find_optional_project
  menu_item :risks

  def index_risk
    @risk = Risk.find(params[:risk_id])
    @version_histories = @risk.versions
  end

  def show_risk
    @risk = Risk.find(params[:risk_id]).find_version(params[:version_id])
  end

  def index_action_plan
    @action_plan = ActionPlan.find(params[:action_plan_id])
    @version_histories = @action_plan.versions
  end

  def show_action_plan
    @action_plan = ActionPlan.find(params[:action_plan_id]).find_version(params[:version_id])
  end

  def find_optional_project
    return true unless params[:id]
    @project = Project.find(params[:id])
    #authorize
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end
