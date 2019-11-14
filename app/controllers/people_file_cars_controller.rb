class PeopleFileCarsController < ApplicationController
  before_action :set_people_file_car, only: [:show, :edit, :update, :destroy]

  # GET /people_file_cars
  # GET /people_file_cars.json
  def index
    @people_file_cars = PeopleFileCar.all
  end

  # GET /people_file_cars/1
  # GET /people_file_cars/1.json
  def show
  end

  # GET /people_file_cars/new
  def new
    @people_file_car = PeopleFileCar.new
  end

  # GET /people_file_cars/1/edit
  def edit
  end

  # POST /people_file_cars
  # POST /people_file_cars.json
  def create
    @people_file_car = PeopleFileCar.new(people_file_car_params)

    respond_to do |format|
      if @people_file_car.save
        format.html { redirect_to @people_file_car, notice: 'People file car was successfully created.' }
        format.json { render :show, status: :created, location: @people_file_car }
      else
        format.html { render :new }
        format.json { render json: @people_file_car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people_file_cars/1
  # PATCH/PUT /people_file_cars/1.json
  def update
    respond_to do |format|
      if @people_file_car.update(people_file_car_params)
        format.html { redirect_to @people_file_car, notice: 'People file car was successfully updated.' }
        format.json { render :show, status: :ok, location: @people_file_car }
      else
        format.html { render :edit }
        format.json { render json: @people_file_car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people_file_cars/1
  # DELETE /people_file_cars/1.json
  def destroy
    @people_file_car.destroy
    respond_to do |format|
      format.html { redirect_to people_file_cars_url, notice: 'People file car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_people_file_car
      @people_file_car = PeopleFileCar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def people_file_car_params
      params.require(:people_file_car).permit(:person_id, :file_car_id, file_car_attributes: [:id, :_destroy, {avatars: []}])
    end
end
