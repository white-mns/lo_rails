class CardsController < ApplicationController
  include MyUtility
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  # GET /cards
  def index
    placeholder_set
    param_set
    @count	= Card.notnil().includes(:p_name, :possession_name, card_data: :kind_name).search(params[:q]).result.count()
    @search	= Card.notnil().includes(:p_name, :possession_name, card_data: :kind_name).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @cards	= @search.result.per(50)
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
    reference_number_assign(params, "s_no", "s_no_form")
    reference_text_assign(params, "name", "name_form")
    reference_text_assign(params, "possession_name_name", "possession_form")
    reference_text_assign(params, "card_data_kind_name_name", "kind_form")
    reference_text_assign(params, "card_data_name", "effect_form")
    reference_number_assign(params, "card_data_lv", "lv_form")
    reference_number_assign(params, "card_data_lp", "lp_form")
    reference_number_assign(params, "card_data_fp", "fp_form")
    
    params[:q]["possession_name_name_eq_any"] ||= []
    if params["possession_is_common"]  == "on" then params[:q]["possession_name_name_eq_any"].push("共有") end
    if params["possession_is_owning"]  == "on" then params[:q]["possession_name_name_eq_any"].push("専有") end
    if params["possession_is_special"] == "on" then params[:q]["possession_name_name_eq_any"].push("特有") end
    if params["possession_is_endemic"] == "on" then params[:q]["possession_name_name_eq_any"].push("固有") end

    params[:q]["card_data_kind_name_name_eq_any"] ||= []
    if params["kind_is_dissociation"] == "on" then params[:q]["card_data_kind_name_name_eq_any"].push("解離") end
    if params["kind_is_first"]        == "on" then params[:q]["card_data_kind_name_name_eq_any"].push("先発") end
    if params["kind_is_trap"]         == "on" then params[:q]["card_data_kind_name_name_eq_any"].push("罠") end
    if params["kind_is_automatic"]    == "on" then params[:q]["card_data_kind_name_name_eq_any"].push("自動") end
    if params["kind_is_abnormity"]    == "on" then params[:q]["card_data_kind_name_name_eq_any"].push("異常") end
    if params["kind_is_moribundity"]  == "on" then params[:q]["card_data_kind_name_name_eq_any"].push("瀕死") end

    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @s_no_form = params["s_no_form"]
    @name_form = params["name_form"]
    @possession_form = params["possession_form"]
    @kind_form = params["kind_form"]
    @effect_form = params["effect_form"]
    @lv_form = params["lv_form"]
    @lp_form = params["lp_form"]
    @fp_form = params["fp_form"]

    @possession_is_common  = params["possession_is_common"]
    @possession_is_owning  = params["possession_is_owning"]
    @possession_is_special = params["possession_is_special"]
    @possession_is_endemic = params["possession_is_endemic"]
    @kind_is_dissociation = params["kind_is_dissociation"]
    @kind_is_first        = params["kind_is_first"]
    @kind_is_trap         = params["kind_is_trap"]
    @kind_is_automatic    = params["kind_is_automatic"]
    @kind_is_abnormity    = params["kind_is_abnormity"]
    @kind_is_moribundity  = params["kind_is_moribundity"]

    @show_detail_e_no = params["show_detail_e_no"]
    @show_detail_s_no = params["show_detail_s_no"]
  end
  # GET /cards/1
  #def show
  #end

  # GET /cards/new
  #def new
  #  @card = Card.new
  #end

  # GET /cards/1/edit
  #def edit
  #end

  # POST /cards
  #def create
  #  @card = Card.new(card_params)

  #  if @card.save
  #    redirect_to @card, notice: 'Card was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /cards/1
  #def update
  #  if @card.update(card_params)
  #    redirect_to @card, notice: 'Card was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /cards/1
  #def destroy
  #  @card.destroy
  #  redirect_to cards_url, notice: 'Card was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def card_params
      params.require(:card).permit(:result_no, :generate_no, :e_no, :s_no, :name, :possession, :kind, :card_id)
    end
end
