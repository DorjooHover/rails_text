class DatabasesController < ApplicationController
  before_action :set_database, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /databases or /databases.json
  def index
    @databases = Database.all
  end

  # GET /databases/1 or /databases/1.json
  def show
  end

  # GET /databases/new
  def new
    # @database = Database.new
    @database = current_user.databases.build
  end

  # GET /databases/1/edit
  def edit
  end

  # POST /databases or /databases.json
  def create
    # @database = Database.new(database_params)
    @database = current_user.databases.build(database_params)
    respond_to do |format|
      if @database.save
        format.html { redirect_to @database, notice: "Database was successfully created." }
        format.json { render :show, status: :created, location: @database }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @database.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /databases/1 or /databases/1.json
  def update
    respond_to do |format|
      if @database.update(database_params)
        format.html { redirect_to @database, notice: "Database was successfully updated." }
        format.json { render :show, status: :ok, location: @database }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @database.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /databases/1 or /databases/1.json
  def destroy
    @database.destroy
    respond_to do |format|
      format.html { redirect_to databases_url, notice: "Database was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @database = current_user.databases.find_by(id: params[:id])
    redirect_to databases_path, notice: "Not Authorized To Edit This Data" if @database.nil?
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_database
      @database = Database.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def database_params
      params.require(:database).permit(:first_name, :last_name, :email, :phone, :twitter, :user_id)
    end
end
