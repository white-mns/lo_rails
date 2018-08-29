class GetCardsController < ApplicationController
  include MyUtility
  before_action :set_get_card, only: [:show, :edit, :update, :destroy]

  # GET /get_cards
  def index
    param_set
    @count	= GetCard.includes(:p_name, card_data: :kind_name).search(params[:q]).result.count()
    @search	= GetCard.includes(:p_name, card_data: :kind_name).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @get_cards	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')
    params["result_no_form"] = params["result_no_form"] ? params["result_no_form"] : sprintf('%d',@last_result)
    params[:q]  = params[:q] ? params[:q] : {}
    
    reference_text_assign(params, "p_name_name", "p_name_form")
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "e_no", "e_no_form")
    reference_text_assign(params, "name", "name_form")
    reference_text_assign(params, "card_data_name", "effect_form")
    reference_number_assign(params, "get_type", "get_type_form")
    reference_number_assign(params, "card_data_lv", "lv_form")
    
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @name_form = params["name_form"]
    @effect_form = params["effect_form"]
    @get_type_form = params["get_type_form"]
    @lv_form = params["lv_form"]
  end
  # GET /get_cards/1
  #def show
  #end

  # GET /get_cards/new
  #def new
  #  @get_card = GetCard.new
  #end

  # GET /get_cards/1/edit
  #def edit
  #end

  # POST /get_cards
  #def create
  #  @get_card = GetCard.new(get_card_params)

  #  if @get_card.save
  #    redirect_to @get_card, notice: 'Get card was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /get_cards/1
  #def update
  #  if @get_card.update(get_card_params)
  #    redirect_to @get_card, notice: 'Get card was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /get_cards/1
  #def destroy
  #  @get_card.destroy
  #  redirect_to get_cards_url, notice: 'Get card was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_get_card
      @get_card = GetCard.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def get_card_params
      params.require(:get_card).permit(:result_no, :generate_no, :e_no, :name, :card_id, :get_type)
    end
end
