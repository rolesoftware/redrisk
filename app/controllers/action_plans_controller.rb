class ActionPlansController < ApplicationController
  # GET /action_plans
  # GET /action_plans.json
  def index
    @action_plans = ActionPlan.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @action_plans }
    end
  end

  # GET /action_plans/1
  # GET /action_plans/1.json
  def show
    @action_plan = ActionPlan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @action_plan }
    end
  end

  # GET /action_plans/new
  # GET /action_plans/new.json
  def new
    @action_plan = ActionPlan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @action_plan }
    end
  end

  # GET /action_plans/1/edit
  def edit
    @action_plan = ActionPlan.find(params[:id])
  end

  # POST /action_plans
  # POST /action_plans.json
  def create
    @action_plan = ActionPlan.new(params[:action_plan])

    respond_to do |format|
      if @action_plan.save
        format.html { redirect_to @action_plan, notice: 'Action plan was successfully created.' }
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
    @action_plan = ActionPlan.find(params[:id])

    respond_to do |format|
      if @action_plan.update_attributes(params[:action_plan])
        format.html { redirect_to @action_plan, notice: 'Action plan was successfully updated.' }
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
    @action_plan = ActionPlan.find(params[:id])
    @action_plan.destroy

    respond_to do |format|
      format.html { redirect_to action_plans_url }
      format.json { head :no_content }
    end
  end
end
