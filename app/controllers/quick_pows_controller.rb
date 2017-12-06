class QuickPowsController < ApplicationController
  before_action :set_quick_pow, only: [:show, :edit, :update, :destroy]

  # GET /quick_pows
  # GET /quick_pows.json
  def index
    @quick_pows = QuickPow.all
  end

  # GET /quick_pows/1
  # GET /quick_pows/1.json
  def show
  end

  # GET /quick_pows/new
  def new
    @quick_pow = QuickPow.new
  end

  # GET /quick_pows/1/edit
  def edit
  end

  def quik_pow_residues(base, pow, ring_of_residues)
    @result = 1
    loop do
      break if pow == 0 || pow < 0
      pow & 1 == 1 ? (@result = (@result * base) % ring_of_residues) : @result = @result
      base = (base * base) % ring_of_residues
      pow = pow >> 1
    end
    return @result
  end 
  # POST /quick_pows
  # POST /quick_pows.json
  def create
    @quick_pow = QuickPow.new(quick_pow_params)
    base              = @quick_pow.basis.to_i
    pow               = @quick_pow.exponent.to_i
    ring_of_residues  = @quick_pow.ring_of_residues.to_i
    quik_pow_residues(base, pow, ring_of_residues)
    @quick_pow.result = @result.to_s
    respond_to do |format|
      if @quick_pow.save
        format.html { redirect_to @quick_pow, notice: 'Quick pow was successfully created.' }
        format.json { render :show, status: :created, location: @quick_pow }
      else
        format.html { render :new }
        format.json { render json: @quick_pow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quick_pows/1
  # PATCH/PUT /quick_pows/1.json
  def update
    respond_to do |format|
      if @quick_pow.update(quick_pow_params)
        format.html { redirect_to @quick_pow, notice: 'Quick pow was successfully updated.' }
        format.json { render :show, status: :ok, location: @quick_pow }
      else
        format.html { render :edit }
        format.json { render json: @quick_pow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quick_pows/1
  # DELETE /quick_pows/1.json
  def destroy
    @quick_pow.destroy
    respond_to do |format|
      format.html { redirect_to quick_pows_url, notice: 'Quick pow was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quick_pow
      @quick_pow = QuickPow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quick_pow_params
      params.require(:quick_pow).permit(:basis, :exponent, :ring_of_residues, :result)
    end
end
