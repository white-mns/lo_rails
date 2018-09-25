class NewGetCardsController < ApplicationController
  include MyUtility
  before_action :set_new_get_card, only: [:show, :edit, :update, :destroy]

  # GET /new_get_cards
  def index
    param_set
    @count	= NewGetCard.notnil().includes(:card_data).search(params[:q]).result.count()
    @search	= NewGetCard.notnil().includes(:card_data).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @new_get_cards	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')
    
    params[:q] ||= {}
    if !params["is_form"] then
        params["result_no_form"]  ||= sprintf('%d',@last_result)
        params["is_get_type_all"] ||= "on"
    end
    
    reference_text_assign(params, "p_name_name", "p_name_form")
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "card_id", "card_id_form")
    reference_number_assign(params, "get_type", "get_type_form")
    reference_text_assign(params, "card_data_name", "effect_form")
    reference_number_assign(params, "card_data_lv", "lv_form")
    reference_text_assign(params, "card_data_kind_name_name", "kind_form")
    reference_number_assign(params, "card_data_lp", "lp_form")
    reference_number_assign(params, "card_data_fp", "fp_form")
    
    params[:q]["get_type_eq_any"] ||= []
    if params["is_get_type_all"] == "on" then params[:q]["get_type_eq_any"].push(0) end
    if params["is_get_type_create"] == "on" then params[:q]["get_type_eq_any"].push(1) end
    if params["is_get_type_drop"] == "on" then params[:q]["get_type_eq_any"].push(2) end
    if params["is_get_type_event"] == "on" then params[:q]["get_type_eq_any"].push(3) end

    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @card_id_form = params["card_id_form"]
    @get_type_form = params["get_type_form"]

    @effect_form = params["effect_form"]
    @lv_form = params["lv_form"]
    @kind_form = params["kind_form"]
    @lp_form = params["lp_form"]
    @fp_form = params["fp_form"]
    
    @is_get_type_all = params["is_get_type_all"]
    @is_get_type_create = params["is_get_type_create"]
    @is_get_type_drop = params["is_get_type_drop"]
    @is_get_type_event = params["is_get_type_event"]

    @is_show_card_detail = params["is_show_card_detail"]
  end
  # GET /new_get_cards/1
  #def show
  #end

  # GET /new_get_cards/new
  #def new
  #  @new_get_card = NewGetCard.new
  #end

  # GET /new_get_cards/1/edit
  #def edit
  #end

  # POST /new_get_cards
  #def create
  #  @new_get_card = NewGetCard.new(new_get_card_params)

  #  if @new_get_card.save
  #    redirect_to @new_get_card, notice: 'New get card was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /new_get_cards/1
  #def update
  #  if @new_get_card.update(new_get_card_params)
  #    redirect_to @new_get_card, notice: 'New get card was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /new_get_cards/1
  #def destroy
  #  @new_get_card.destroy
  #  redirect_to new_get_cards_url, notice: 'New get card was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_new_get_card
      @new_get_card = NewGetCard.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def new_get_card_params
      params.require(:new_get_card).permit(:result_no, :generate_no, :card_id, :get_type)
    end
end
