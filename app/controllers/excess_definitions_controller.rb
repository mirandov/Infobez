class ExcessDefinitionsController < ApplicationController
  before_action :set_excess_definition, only: [:show, :edit, :update, :destroy]

  # GET /excess_definitions
  # GET /excess_definitions.json
  def index
    @excess_definitions = ExcessDefinition.all
  end

  # GET /excess_definitions/1
  # GET /excess_definitions/1.json
  def show
  end

  # GET /excess_definitions/new
  def new
    @excess_definition = ExcessDefinition.new
  end

  # GET /excess_definitions/1/edit
  def edit
  end

  # POST /excess_definitions
  # POST /excess_definitions.json
  def create
    pi = 3.1415926535897
    # raise @excess_definition.v_value.inspect
    @excess_definition = ExcessDefinition.new(excess_definition_params)
    min_sec = (((@excess_definition.sec.to_f / 60) + @excess_definition.min.to_f) / 60).to_s.split('.')[1]
    angle = [@excess_definition.v_value, min_sec].join(".")
    @excess_definition.h_value = (@excess_definition.d_value.to_f * Math::tan(angle.to_f * pi / 180) + @excess_definition.i_value.to_f - @excess_definition.const.to_f).round(3)
    respond_to do |format|
      if @excess_definition.save
        format.html { redirect_to excess_definitions_path, notice: 'H посчитана' }
        format.json { render :show, status: :created, location: @excess_definition }
      else
        format.html { render :new }
        format.json { render json: @excess_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /excess_definitions/1
  # PATCH/PUT /excess_definitions/1.json
  def update
    respond_to do |format|
      if @excess_definition.update(excess_definition_params)
        format.html { redirect_to @excess_definition, notice: 'Excess definition was successfully updated.' }
        format.json { render :show, status: :ok, location: @excess_definition }
      else
        format.html { render :edit }
        format.json { render json: @excess_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /excess_definitions/1
  # DELETE /excess_definitions/1.json
  def destroy
    @excess_definition.destroy
    respond_to do |format|
      format.html { redirect_to excess_definitions_url, notice: 'Удалено' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_excess_definition
      @excess_definition = ExcessDefinition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def excess_definition_params
      params.require(:excess_definition).permit(:v_value, :d_value, :i_value, :h_value, :const, :min, :sec)
    end
end
