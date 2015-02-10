class RisksController < ApplicationController
  before_filter :find_optional_project, except: [:get_category_by_source]

  def index
    @risks = Risk.all
    @action_plans = ActionPlan.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @risks }
    end
  end

  def show
    @risk = Risk.find(params[:risk_id])
    @action_plans = ActionPlan.all

    respond_to do |format|
      format.html # show.html.erb
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
    @risk = Risk.new(params[:risk])

    respond_to do |format|
      if @risk.save
        format.html { redirect_to show_risk_path(risk_id: @risk.id), notice: 'Risk was successfully created.' }
        format.json { render json: @risk, status: :created, location: @risk }
      else
        format.html { render action: "new" }
        format.json { render json: @risk.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @risk = Risk.find(params[:risk_id])
    respond_to do |format|
      if @risk.update_attributes(params[:risk])
        format.html { redirect_to show_risk_path(risk_id: @risk.id), notice: 'Risk was successfully updated.' }
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

  def find_optional_project
    return true unless params[:id]
    @project = Project.find(params[:id])
    authorize
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end
