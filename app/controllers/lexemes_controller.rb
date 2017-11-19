class LexemesController < ApplicationController
  before_action :set_lexeme, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
  
  # GET /lexemes
  # GET /lexemes.json
  def index
    @lexemes = Lexeme.all
  end

  # GET /lexemes/1
  # GET /lexemes/1.json
  def show
  end

  # GET /lexemes/new
  def new
    @lexeme = Lexeme.new
  end

  # GET /lexemes/1/edit
  def edit
  end

  # POST /lexemes
  # POST /lexemes.json
  def create
    @lexeme = Lexeme.new(lexeme_params)

    respond_to do |format|
      if @lexeme.save
        format.html { redirect_to @lexeme, notice: 'Lexeme was successfully created.' }
        format.json { render :show, status: :created, location: @lexeme }
      else
        format.html { render :new }
        format.json { render json: @lexeme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lexemes/1
  # PATCH/PUT /lexemes/1.json
  def update
    respond_to do |format|
      if @lexeme.update(lexeme_params)
        format.html { redirect_to @lexeme, notice: 'Lexeme was successfully updated.' }
        format.json { render :show, status: :ok, location: @lexeme }
      else
        format.html { render :edit }
        format.json { render json: @lexeme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lexemes/1
  # DELETE /lexemes/1.json
  def destroy
    @lexeme.destroy
    respond_to do |format|
      format.html { redirect_to lexemes_url, notice: 'Lexeme was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lexeme
      @lexeme = Lexeme.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lexeme_params
      params.require(:lexeme).permit(:headword)
    end

    def require_login
      if !signed_in?
        msg = 'You must be logged in to perform this action'
        respond_to do |format|
          format.html { redirect_to(root_path, notice: msg) }
          format.json { render(errors: msg, status: :unprocessable_entity) }
        end
      end
    end
end
