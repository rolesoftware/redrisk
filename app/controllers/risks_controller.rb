class RisksController < ApplicationController
  before_filter :find_optional_project, except: [:get_category_by_source]

  def index
    @risks = Risk.where(project_identifier: @project.identifier)
    @action_plans = ActionPlan.joins(:risk).where('risks.project_identifier = ?',  @project.identifier)

    respond_to do |format|
      format.html # index_risk.html.erb
      format.json { render json: @risks }
    end
  end

  def show
    @risk = Risk.find(params[:risk_id])
    @action_plans = @risk.action_plans

    respond_to do |format|
      format.html # _show_template.html.erb
      format.json { render json: @risk }
    end
  end

  def new
    @risk = Risk.new

    respond_to do |format|
      format.html
      format.json { render json: @risk }
    end
  end

  def edit
    @risk = Risk.find(params[:risk_id])
    @risk_categories = Risk.get_category_by_source(@risk.source)
  end

  def create
    params[:risk][:cost] = RedRiskUtil.convert_money_to_float(params[:risk][:cost])
    @risk = Risk.new(params[:risk])
    @risk.project_identifier = @project.identifier
    respond_to do |format|
      if @risk.save
        format.html { redirect_to show_risk_path(risk_id: @risk.id), notice: Risk.model_name.human(count:1) + ' ' + I18n.t('was_successfully_created') }
        format.json { render json: @risk, status: :created, location: @risk }
      else
        format.html { render action: "new" }
        format.json { render json: @risk.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    params[:risk][:cost] = RedRiskUtil.convert_money_to_float(params[:risk][:cost])
    @risk = Risk.find(params[:risk_id])
    respond_to do |format|
      if @risk.update_attributes(params[:risk])
        format.html { redirect_to show_risk_path(risk_id: @risk.id), notice: Risk.model_name.human(count:1) + ' ' + I18n.t('was_successfully_updated') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @risk.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @risk = Risk.find(params[:risk_id])
    @risk.destroy

    respond_to do |format|
      format.html { redirect_to risks_url }
      format.json { head :no_content }
    end
  end

  def get_category_by_source
    render json: Risk.get_category_by_source(params[:source_id].to_i)
  end

  def get_priority_by_probability_and_impact
    render json: Risk.get_priority_by_probability_and_impact(params[:probability_id].to_i, params[:impact_id].to_i)
  end

  def find_optional_project
    return true unless params[:id]
    @project = Project.find(params[:id])
    authorize
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end
