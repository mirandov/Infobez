class FileCarsController < ApplicationController
  before_action :set_file_car, only: [:show, :edit, :update, :destroy]

  # GET /file_cars
  # GET /file_cars.json
  def index
    @file_cars = FileCar.all
  end

  # GET /file_cars/1
  # GET /file_cars/1.json
  def show
  end

  # GET /file_cars/new
  def new
    @file_car = FileCar.new
  end

  # GET /file_cars/1/edit
  def edit
  end

  # POST /file_cars
  # POST /file_cars.json
  def create
    @file_car = FileCar.new(file_car_params)
    respond_to do |format|
      if @file_car.save
        @people_file_cars = PeopleFileCar.create!(person_id: params[:id], file_car_id: @file_car.id)
        format.html { redirect_to Person.find(params[:id]), notice: 'Файлы добавлены' }
        format.json { render :show, status: :created, location: @file_car }
      else
        format.html { render :new }
        format.json { render json: @file_car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /file_cars/1
  # PATCH/PUT /file_cars/1.json
  def update
    respond_to do |format|
      if @file_car.update(file_car_params)
        format.html { redirect_to @file_car, notice: 'File car was successfully updated.' }
        format.json { render :show, status: :ok, location: @file_car }
      else
        format.html { render :edit }
        format.json { render json: @file_car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /file_cars/1
  # DELETE /file_cars/1.json
  def destroy
    @file_car.destroy
    respond_to do |format|
      format.html { redirect_to file_cars_url, notice: 'File car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_file_car
      @file_car = FileCar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def file_car_params
      params.require(:file_car).permit( {avatars: []})
    end
end
