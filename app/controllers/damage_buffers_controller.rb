class DamageBuffersController < ApplicationController
  include MyUtility
  before_action :set_damage_buffer, only: [:show, :edit, :update, :destroy]

  # GET /damage_buffers
  def index
    placeholder_set
    param_set
    @count	= DamageBuffer.notnil().includes(:p_name).search(params[:q]).result.count()
    @search	= DamageBuffer.notnil().includes(:p_name).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @damage_buffers	= @search.result.per(50)
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
    reference_number_assign(params, "battle_page", "battle_page_form")
    reference_number_assign(params, "act_id", "act_id_form")
    reference_number_assign(params, "e_no", "e_no_form")
    reference_text_assign(params, "buffer_name", "buffer_form")
    reference_number_assign(params, "lv", "lv_form")
    reference_number_assign(params, "value", "value_form")
    
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @battle_page_form = params["battle_page_form"]
    @act_id_form = params["act_id_form"]
    @e_no_form = params["e_no_form"]
    @buffer_form = params["buffer_form"]
    @lv_form = params["lv_form"]
    @value_form = params["value_form"]
  end
  # GET /damage_buffers/1
  #def show
  #end

  # GET /damage_buffers/new
  #def new
  #  @damage_buffer = DamageBuffer.new
  #end

  # GET /damage_buffers/1/edit
  #def edit
  #end

  # POST /damage_buffers
  #def create
  #  @damage_buffer = DamageBuffer.new(damage_buffer_params)

  #  if @damage_buffer.save
  #    redirect_to @damage_buffer, notice: 'Damage buffer was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /damage_buffers/1
  #def update
  #  if @damage_buffer.update(damage_buffer_params)
  #    redirect_to @damage_buffer, notice: 'Damage buffer was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /damage_buffers/1
  #def destroy
  #  @damage_buffer.destroy
  #  redirect_to damage_buffers_url, notice: 'Damage buffer was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_damage_buffer
      @damage_buffer = DamageBuffer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def damage_buffer_params
      params.require(:damage_buffer).permit(:result_no, :generate_no, :battle_page, :act_id, :e_no, :buffer_id, :lv, :value)
    end
end
