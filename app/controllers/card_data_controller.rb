class CardDataController < ApplicationController
  include MyUtility
  before_action :set_card_datum, only: [:show, :edit, :update, :destroy]

  # GET /card_data
  def index
    placeholder_set
    param_set
    @count	= CardDatum.includes(:kind_name).ransack(params[:q]).result.count()
    @search	= CardDatum.includes(:kind_name).page(params[:page]).ransack(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @card_data	= @search.result.per(50)
  end

  def param_set
    params_clean(params)
    
    reference_number_assign(params, "card_id", "card_id_form")
    reference_text_assign(params, "name", "name_form")
    reference_text_assign(params, "kind_name_name", "kind_form")
    reference_number_assign(params, "lv", "lv_form")
    reference_number_assign(params, "lp", "lp_form")
    reference_number_assign(params, "fp", "fp_form")
    
    @card_id_form = params["card_id_form"]
    @name_form = params["name_form"]
    @kind_form = params["kind_form"]
    @lv_form = params["lv_form"]
    @lp_form = params["lp_form"]
    @fp_form = params["fp_form"]
  end
  # GET /card_data/1
  #def show
  #end

  # GET /card_data/new
  #def new
  #  @card_datum = CardDatum.new
  #end

  # GET /card_data/1/edit
  #def edit
  #end

  # POST /card_data
  #def create
  #  @card_datum = CardDatum.new(card_datum_params)

  #  if @card_datum.save
  #    redirect_to @card_datum, notice: 'Card datum was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /card_data/1
  #def update
  #  if @card_datum.update(card_datum_params)
  #    redirect_to @card_datum, notice: 'Card datum was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /card_data/1
  #def destroy
  #  @card_datum.destroy
  #  redirect_to card_data_url, notice: 'Card datum was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_datum
      @card_datum = CardDatum.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def card_datum_params
      params.require(:card_datum).permit(:card_id, :name, :lv, :lp, :fp)
    end
end
