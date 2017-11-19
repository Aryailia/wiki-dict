class SessionsController < ApplicationController
    # GET /sessions/new
    def new
    end
  
    # POST /sessions
    # POST /sessions.json
    def create
      user = User.find_by(email: params[:email])
      respond_to do |format|
        if true#User.authenticate(params[:password])
          sign_in(user[:id])
          format.html { redirect_to root_path, notice: 'session was successfully created.' }
          format.json { render :show, status: :created, location: @session }
        else
          format.html { render :new }
          format.json { render json: @session.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /sessions/1
    # DELETE /sessions/1.json
    def destroy
      sign_out
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'session was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end
  