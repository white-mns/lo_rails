class CardUsePagesController < ApplicationController
  include MyUtility
  before_action :set_card_use_page, only: [:show, :edit, :update, :destroy]

  # GET /card_use_pages
  def index
    param_set
    @count	= CardUsePage.includes(:p_name).search(params[:q]).result.count()
    @search	= CardUsePage.includes(:p_name).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @card_use_pages	= @search.result.per(50)
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
    reference_number_assign(params, "battle_page", "battle_page_form")
    reference_number_assign(params, "party", "party_form")
    reference_number_assign(params, "use_cards", "use_cards_form")
    
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @battle_page_form = params["battle_page_form"]
    @party_form = params["party_form"]
    @use_cards_form = params["use_cards_form"]
  end
  # GET /card_use_pages/1
  #def show
  #end

  # GET /card_use_pages/new
  #def new
  #  @card_use_page = CardUsePage.new
  #end

  # GET /card_use_pages/1/edit
  #def edit
  #end

  # POST /card_use_pages
  #def create
  #  @card_use_page = CardUsePage.new(card_use_page_params)

  #  if @card_use_page.save
  #    redirect_to @card_use_page, notice: 'Card use page was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /card_use_pages/1
  #def update
  #  if @card_use_page.update(card_use_page_params)
  #    redirect_to @card_use_page, notice: 'Card use page was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /card_use_pages/1
  #def destroy
  #  @card_use_page.destroy
  #  redirect_to card_use_pages_url, notice: 'Card use page was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_use_page
      @card_use_page = CardUsePage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def card_use_page_params
      params.require(:card_use_page).permit(:result_no, :generate_no, :battle_page, :party, :use_cards)
    end
end
