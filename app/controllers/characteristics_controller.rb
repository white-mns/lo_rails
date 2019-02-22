class CharacteristicsController < ApplicationController
  include MyUtility
  before_action :set_characteristic, only: [:show, :edit, :update, :destroy]

  # GET /characteristics
  def index
    placeholder_set
    param_set
    @count	= Characteristic.notnil().includes(:p_name).search(params[:q]).result.count()
    @search	= Characteristic.notnil().includes(:p_name).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @characteristics	= @search.result.per(50)
  end

  # GET /characteristic/graph
  def graph
    index
    @trainings	= @search.result
  end

  def param_set
    @latest_result = Name.maximum('result_no')

    params_clean(params)
    if !params["is_form"] then
        params["result_no_form"] ||= sprintf('%d',@latest_result)
    end
    
    reference_text_assign(params, "p_name_name", "p_name_form")
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "e_no", "e_no_form")
    reference_number_assign(params, "str", "str_form")
    reference_number_assign(params, "vit", "vit_form")
    reference_number_assign(params, "int", "int_form")
    reference_number_assign(params, "mnd", "mnd_form")
    reference_number_assign(params, "tec", "tec_form")
    reference_number_assign(params, "eva", "eva_form")
    
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @str_form = params["str_form"]
    @vit_form = params["vit_form"]
    @int_form = params["int_form"]
    @mnd_form = params["mnd_form"]
    @tec_form = params["tec_form"]
    @eva_form = params["eva_form"]
  end
  # GET /characteristics/1
  #def show
  #end

  # GET /characteristics/new
  #def new
  #  @characteristic = Characteristic.new
  #end

  # GET /characteristics/1/edit
  #def edit
  #end

  # POST /characteristics
  #def create
  #  @characteristic = Characteristic.new(characteristic_params)

  #  if @characteristic.save
  #    redirect_to @characteristic, notice: 'Characteristic was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /characteristics/1
  #def update
  #  if @characteristic.update(characteristic_params)
  #    redirect_to @characteristic, notice: 'Characteristic was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /characteristics/1
  #def destroy
  #  @characteristic.destroy
  #  redirect_to characteristics_url, notice: 'Characteristic was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_characteristic
      @characteristic = Characteristic.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def characteristic_params
      params.require(:characteristic).permit(:result_no, :generate_no, :e_no, :str, :vit, :int, :mnd, :tec, :eva)
    end
end
