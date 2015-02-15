class ActionPlansController < ApplicationController
  before_filter :find_optional_project
  menu_item :risks

  # GET /action_plans
  # GET /action_plans.json
  def index
    @action_plans = ActionPlan.all

    respond_to do |format|
      format.html # index_risk.html.erb
      format.json { render json: @action_plans }
    end
  end

  # GET /action_plans/1
  # GET /action_plans/1.json
  def show
    @action_plan = ActionPlan.find(params[:action_plan_id])

    respond_to do |format|
      format.html # _show_template.html.erb
      format.json { render json: @action_plan }
    end
  end

  # GET /action_plans/new
  # GET /action_plans/new.json
  def new
    @action_plan = ActionPlan.new
    @risk = Risk.find(params[:risk_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @action_plan }
    end
  end

  # GET /action_plans/1/edit
  def edit
    @action_plan = ActionPlan.find(params[:action_plan_id])
  end

  # POST /action_plans
  # POST /action_plans.json
  def create
    @action_plan = ActionPlan.new(params[:action_plan])
    @action_plan.risk_id = params[:risk_id]
    respond_to do |format|
      if @action_plan.save
        format.html { redirect_to show_action_plan_url(action_plan_id: @action_plan.id), notice: ActionPlan.model_name.human(count:1) + ' ' + I18n.t('female_was_successfully_updated') }
        format.json { render json: @action_plan, status: :created, location: @action_plan }
      else
        format.html { render action: "new" }
        format.json { render json: @action_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /action_plans/1
  # PUT /action_plans/1.json
  def update
    @action_plan = ActionPlan.find(params[:action_plan_id])

    respond_to do |format|
      if @action_plan.update_attributes(params[:action_plan])
        format.html { redirect_to show_action_plan_url(action_plan_id: @action_plan.id), notice: ActionPlan.model_name.human(count:1) + ' ' + I18n.t('female_was_successfully_updated') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @action_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /action_plans/1
  # DELETE /action_plans/1.json
  def destroy
    @action_plan = ActionPlan.find(params[:action_plan_id])
    @action_plan.destroy

    respond_to do |format|
      format.html { redirect_to risks_path }
      format.json { head :no_content }
    end
  end

  def find_optional_project
    return true unless params[:id]
    @project = Project.find(params[:id])
    #authorize
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end
