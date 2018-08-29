class DropMinSubjectsController < ApplicationController
  include MyUtility
  before_action :set_drop_min_subject, only: [:show, :edit, :update, :destroy]

  # GET /drop_min_subjects
  def index
    param_set
    @count	= DropMinSubject.includes(card_data: :kind_name).search(params[:q]).result.count()
    @search	= DropMinSubject.includes(card_data: :kind_name).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @drop_min_subjects	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')
    params["result_no_form"] = params["result_no_form"] ? params["result_no_form"] : sprintf('%d',@last_result)
    params[:q]  = params[:q] ? params[:q] : {}
    
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "card_id", "card_id_form")
    reference_number_assign(params, "slash", "slash_form")
    reference_number_assign(params, "thrust", "thrust_form")
    reference_number_assign(params, "stroke", "stroke_form")
    reference_number_assign(params, "shot", "shot_form")
    reference_number_assign(params, "guard", "guard_form")
    reference_number_assign(params, "dance", "dance_form")
    reference_number_assign(params, "theft", "theft_form")
    reference_number_assign(params, "cooking", "cooking_form")
    reference_number_assign(params, "technology", "technology_form")
    reference_number_assign(params, "movement", "movement_form")
    reference_number_assign(params, "chemistry", "chemistry_form")
    reference_number_assign(params, "arithmetic", "arithmetic_form")
    reference_number_assign(params, "fire", "fire_form")
    reference_number_assign(params, "theology", "theology_form")
    reference_number_assign(params, "life", "life_form")
    reference_number_assign(params, "demonology", "demonology_form")
    reference_number_assign(params, "geography", "geography_form")
    reference_number_assign(params, "astronomy", "astronomy_form")
    reference_number_assign(params, "fengshui", "fengshui_form")
    reference_number_assign(params, "psychology", "psychology_form")
    reference_number_assign(params, "music", "music_form")
    reference_number_assign(params, "curse", "curse_form")
    reference_number_assign(params, "illusion", "illusion_form")
    reference_number_assign(params, "trick", "trick_form")
    reference_text_assign(params, "card_data_name", "effect_form")
    reference_number_assign(params, "card_data_lv", "lv_form")
    
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @card_id_form = params["card_id_form"]
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
    @effect_form = params["effect_form"]
    @lv_form = params["lv_form"]
  end
  # GET /drop_min_subjects/1
  #def show
  #end

  # GET /drop_min_subjects/new
  #def new
  #  @drop_min_subject = DropMinSubject.new
  #end

  # GET /drop_min_subjects/1/edit
  #def edit
  #end

  # POST /drop_min_subjects
  #def create
  #  @drop_min_subject = DropMinSubject.new(drop_min_subject_params)

  #  if @drop_min_subject.save
  #    redirect_to @drop_min_subject, notice: 'Drop min subject was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /drop_min_subjects/1
  #def update
  #  if @drop_min_subject.update(drop_min_subject_params)
  #    redirect_to @drop_min_subject, notice: 'Drop min subject was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /drop_min_subjects/1
  #def destroy
  #  @drop_min_subject.destroy
  #  redirect_to drop_min_subjects_url, notice: 'Drop min subject was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drop_min_subject
      @drop_min_subject = DropMinSubject.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def drop_min_subject_params
      params.require(:drop_min_subject).permit(:result_no, :generate_no, :card_id, :slash, :thrust, :stroke, :shot, :guard, :dance, :theft, :cooking, :technology, :movement, :chemistry, :arithmetic, :fire, :theology, :life, :demonology, :geography, :astronomy, :fengshui, :psychology, :music, :curse, :illusion, :trick)
    end
end
