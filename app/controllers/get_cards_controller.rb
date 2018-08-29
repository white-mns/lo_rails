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

  def drop_subjects
    param_set
    @count	= GetCard.includes(:p_name, :subject, card_data: :kind_name).search(params[:q]).result.count()
    @search	= GetCard.includes(:p_name, :subject, card_data: :kind_name).page(params[:page]).search(params[:q])
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
    reference_number_assign(params, "subject_slash", "slash_form")
    reference_number_assign(params, "subject_thrust", "thrust_form")
    reference_number_assign(params, "subject_stroke", "stroke_form")
    reference_number_assign(params, "subject_shot", "shot_form")
    reference_number_assign(params, "subject_guard", "guard_form")
    reference_number_assign(params, "subject_dance", "dance_form")
    reference_number_assign(params, "subject_theft", "theft_form")
    reference_number_assign(params, "subject_cooking", "cooking_form")
    reference_number_assign(params, "subject_technology", "technology_form")
    reference_number_assign(params, "subject_movement", "movement_form")
    reference_number_assign(params, "subject_chemistry", "chemistry_form")
    reference_number_assign(params, "subject_arithmetic", "arithmetic_form")
    reference_number_assign(params, "subject_fire", "fire_form")
    reference_number_assign(params, "subject_theology", "theology_form")
    reference_number_assign(params, "subject_life", "life_form")
    reference_number_assign(params, "subject_demonology", "demonology_form")
    reference_number_assign(params, "subject_geography", "geography_form")
    reference_number_assign(params, "subject_astronomy", "astronomy_form")
    reference_number_assign(params, "subject_fengshui", "fengshui_form")
    reference_number_assign(params, "subject_psychology", "psychology_form")
    reference_number_assign(params, "subject_music", "music_form")
    reference_number_assign(params, "subject_curse", "curse_form")
    reference_number_assign(params, "subject_illusion", "illusion_form")
    reference_number_assign(params, "subject_trick", "trick_form")
    
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @name_form = params["name_form"]
    @effect_form = params["effect_form"]
    @get_type_form = params["get_type_form"]
    @lv_form = params["lv_form"]
    @slash_form = params["slash_form"]
    @thrust_form = params["thrust_form"]
    @stroke_form = params["stroke_form"]
    @shot_form = params["shot_form"]
    @guard_form = params["guard_form"]
    @dance_form = params["dance_form"]
    @theft_form = params["theft_form"]
    @cooking_form = params["cooking_form"]
    @technology_form = params["technology_form"]
    @movement_form = params["movement_form"]
    @chemistry_form = params["chemistry_form"]
    @arithmetic_form = params["arithmetic_form"]
    @fire_form = params["fire_form"]
    @theology_form = params["theology_form"]
    @life_form = params["life_form"]
    @demonology_form = params["demonology_form"]
    @geography_form = params["geography_form"]
    @astronomy_form = params["astronomy_form"]
    @fengshui_form = params["fengshui_form"]
    @psychology_form = params["psychology_form"]
    @music_form = params["music_form"]
    @curse_form = params["curse_form"]
    @illusion_form = params["illusion_form"]
    @trick_form = params["trick_form"]
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
