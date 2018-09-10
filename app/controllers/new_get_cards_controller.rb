class NewGetCardsController < ApplicationController
  include MyUtility
  before_action :set_new_get_card, only: [:show, :edit, :update, :destroy]

  # GET /new_get_cards
  def index
    param_set
    @count	= NewGetCard.includes(:p_name).search(params[:q]).result.count()
    @search	= NewGetCard.includes(:p_name).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @new_get_cards	= @search.result.per(50)
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
    reference_number_assign(params, "get_type", "get_type_form")
    
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @card_id_form = params["card_id_form"]
    @get_type_form = params["get_type_form"]
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
