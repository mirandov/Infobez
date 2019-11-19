class CheckListsController < ApplicationController
  before_action :set_check_list, only: [:show, :edit, :update, :destroy]

  # GET /check_lists
  # GET /check_lists.json
  def index
    @q = CheckList.ransack(params[:q])
    @check_lists = @q.result(distinct: true)
  end

  # GET /check_lists/1
  # GET /check_lists/1.json
  def show
  end

  # GET /check_lists/new
  def new
    @check_list = CheckList.new
  end

  # GET /check_lists/1/edit
  def edit
  end

  # POST /check_lists
  # POST /check_lists.json
  def create
    @check_list = CheckList.new(check_list_params)
    @check_list.price = total_price(params[:check_list][:orders_attributes])
    @check_list.sale  = (@check_list.price * @check_list.sale) / 100.0
    Person.find(@check_list.person_id).update!(last_visit: @check_list.order_date)
    # raise params.inspect
    respond_to do |format|
      if @check_list.save
        format.html { redirect_to Person.find(@check_list.person_id), notice: 'Check list was successfully created.' }
        format.json { render :show, status: :created, location: @check_list }
      else
        format.html { render :new }
        format.json { render json: @check_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /check_lists/1
  # PATCH/PUT /check_lists/1.json
  def update
    respond_to do |format|
      if @check_list.update(check_list_params)
        format.html { redirect_to Person.find(@check_list.person_id), notice: 'Check list was successfully updated.' }
        format.json { render :show, status: :ok, location: @check_list }
      else
        format.html { render :edit }
        format.json { render json: @check_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /check_lists/1
  # DELETE /check_lists/1.json
  def destroy
    @check_list.destroy
    respond_to do |format|
      format.html { redirect_to check_lists_url, notice: 'Check list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def total_price(orders)
      sum_price = 0
      orders.each do |o|
        sum_price+= o[1][:price].to_i
      end
      return sum_price
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_check_list
      @check_list = CheckList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def check_list_params
      params.require(:check_list).permit(:person_id, :admin_id, :sale, :comment, :order_date, :price, orders_attributes: [:id, :service_id, :person_id, :price, :name_service, :_destroy])
    end
end
