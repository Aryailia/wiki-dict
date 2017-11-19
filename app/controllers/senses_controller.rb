class SensesController < ApplicationController
  before_action :set_sense, only: [:show, :edit, :update, :destroy]

  # GET /senses
  # GET /senses.json
  def index
    @senses = Sense.all
  end

  # GET /senses/1
  # GET /senses/1.json
  def show
  end

  # GET /senses/new
  def new
    @sense = Sense.new
  end

  # GET /senses/1/edit
  def edit
  end

  # POST /senses
  # POST /senses.json
  def create
    @sense = Sense.new(sense_params)

    respond_to do |format|
      if @sense.save
        format.html { redirect_to @sense, notice: 'Sense was successfully created.' }
        format.json { render :show, status: :created, location: @sense }
      else
        format.html { render :new }
        format.json { render json: @sense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /senses/1
  # PATCH/PUT /senses/1.json
  def update
    respond_to do |format|
      if @sense.update(sense_params)
        format.html { redirect_to @sense, notice: 'Sense was successfully updated.' }
        format.json { render :show, status: :ok, location: @sense }
      else
        format.html { render :edit }
        format.json { render json: @sense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /senses/1
  # DELETE /senses/1.json
  def destroy
    @sense.destroy
    respond_to do |format|
      format.html { redirect_to senses_url, notice: 'Sense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sense
      @sense = Sense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sense_params
      params.require(:sense).permit(:type, :content, :lexeme_id)
    end
end
