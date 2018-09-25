class NewCardUsesController < ApplicationController
  include MyUtility
  before_action :set_new_card_use, only: [:show, :edit, :update, :destroy]

  # GET /new_card_uses
  def index
    param_set
    @count	= NewCardUse.notnil().includes(:card_data).search(params[:q]).result.count()
    @search	= NewCardUse.notnil().includes(:card_data).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @new_card_uses	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')
    
    params[:q] ||= {}
    if !params["is_form"] then
        params["result_no_form"] ||= sprintf('%d',@last_result)
    end
    
    reference_text_assign(params, "p_name_name", "p_name_form")
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "card_id", "card_id_form")
    reference_text_assign(params, "card_data_name", "effect_form")
    reference_number_assign(params, "card_data_lv", "lv_form")
    reference_text_assign(params, "card_data_kind_name_name", "kind_form")
    reference_number_assign(params, "card_data_lp", "lp_form")
    reference_number_assign(params, "card_data_fp", "fp_form")
    
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @card_id_form = params["card_id_form"]
    
    @effect_form = params["effect_form"]
    @lv_form = params["lv_form"]
    @kind_form = params["kind_form"]
    @lp_form = params["lp_form"]
    @fp_form = params["fp_form"]

    @is_show_card_detail = params["is_show_card_detail"]
  end
  # GET /new_card_uses/1
  #def show
  #end

  # GET /new_card_uses/new
  #def new
  #  @new_card_use = NewCardUse.new
  #end

  # GET /new_card_uses/1/edit
  #def edit
  #end

  # POST /new_card_uses
  #def create
  #  @new_card_use = NewCardUse.new(new_card_use_params)

  #  if @new_card_use.save
  #    redirect_to @new_card_use, notice: 'New card use was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /new_card_uses/1
  #def update
  #  if @new_card_use.update(new_card_use_params)
  #    redirect_to @new_card_use, notice: 'New card use was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /new_card_uses/1
  #def destroy
  #  @new_card_use.destroy
  #  redirect_to new_card_uses_url, notice: 'New card use was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_new_card_use
      @new_card_use = NewCardUse.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def new_card_use_params
      params.require(:new_card_use).permit(:result_no, :generate_no, :card_id)
    end
end
