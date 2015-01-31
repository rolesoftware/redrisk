class RisksController < ApplicationController
  # GET /risks
  # GET /risks.json
  def index
    @risks = Risk.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @risks }
    end
  end

  # GET /risks/1
  # GET /risks/1.json
  def show
    @risk = Risk.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @risk }
    end
  end

  # GET /risks/new
  # GET /risks/new.json
  def new
    @risk = Risk.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @risk }
    end
  end

  # GET /risks/1/edit
  def edit
    @risk = Risk.find(params[:id])
  end

  # POST /risks
  # POST /risks.json
  def create
    @risk = Risk.new(params[:risk])

    respond_to do |format|
      if @risk.save
        format.html { redirect_to @risk, notice: 'Risk was successfully created.' }
        format.json { render json: @risk, status: :created, location: @risk }
      else
        format.html { render action: "new" }
        format.json { render json: @risk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /risks/1
  # PUT /risks/1.json
  def update
    @risk = Risk.find(params[:id])

    respond_to do |format|
      if @risk.update_attributes(params[:risk])
        format.html { redirect_to @risk, notice: 'Risk was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @risk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /risks/1
  # DELETE /risks/1.json
  def destroy
    @risk = Risk.find(params[:id])
    @risk.destroy

    respond_to do |format|
      format.html { redirect_to risks_url }
      format.json { head :no_content }
    end
  end
end
