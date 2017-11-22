class Rc4ProgramsController < ApplicationController
  before_action :set_rc4_program, only: [:show, :edit, :update, :destroy]

  # GET /rc4_programs
  # GET /rc4_programs.json
  def index
    @rc4_programs = Rc4Program.all
  end

  # GET /rc4_programs/1
  # GET /rc4_programs/1.json
  def show
  end

  # GET /rc4_programs/new
  def new
    @rc4_program = Rc4Program.new
  end

  # GET /rc4_programs/1/edit
  def edit
  end

  # POST /rc4_programs
  # POST /rc4_programs.json
  def create
    @rc4_program = Rc4Program.new(rc4_program_params)
    key = @rc4_program.key
    plight_generate key
    @rc4_program.chanted_message = @rc4_program.transient_message
    @rc4_program.message_text = encrypt(@rc4_program.chanted_message)
    raise   @rc4_program.message_text.encode('utf-8').inspect

    # @rc4_program.message_text =  @rc4_program.message_text
    # raise @rc4_program.chanted_message.inspect

    respond_to do |format|
      if @rc4_program.save
        format.html { redirect_to @rc4_program, notice: 'Rc4 program was successfully created.' }
        format.json { render :show, status: :created, location: @rc4_program }
      else
        format.html { render :new }
        format.json { render json: @rc4_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rc4_programs/1
  # PATCH/PUT /rc4_programs/1.json
  def update
    respond_to do |format|
      if @rc4_program.update(rc4_program_params)
        format.html { redirect_to @rc4_program, notice: 'Rc4 program was successfully updated.' }
        format.json { render :show, status: :ok, location: @rc4_program }
      else
        format.html { render :edit }
        format.json { render json: @rc4_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rc4_programs/1
  # DELETE /rc4_programs/1.json
  def destroy
    @rc4_program.destroy
    respond_to do |format|
      format.html { redirect_to rc4_programs_url, notice: 'Rc4 program was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #Шифрование
  def encrypt message
    index = 0
    @q1   = 0
    @q2   = 0

    while index < message.length
      @q1 = (@q1 + 1) % 256
      @q2 = (@q2 + @plight[@q1]) % 256
      @plight[@q1], @plight[@q2] = @plight[@q2], @plight[@q1]
      message.setbyte(index, message.getbyte(index) ^ @plight[(@plight[@q1] + @plight[@q2]) % 256])
      index += 1
    end
    message

  end

  private

    #Инициализация ключей для состояний
    def plight_generate key
      @plight = []
      length  = key.length
      j       = 0

      for i in 0..255
        @plight[i] = i
      end

      @plight.each do |i|
          j = (j + @plight[i] + key.getbyte( i % length)) % 256
          @plight[i], @plight[j] = @plight[j],@plight[i]
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_rc4_program
      @rc4_program = Rc4Program.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rc4_program_params
      params.require(:rc4_program).permit(:key, :transient_message, :chanted_message, :message_text)
    end
end
