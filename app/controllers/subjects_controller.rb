class SubjectsController < ApplicationController
  include MyUtility
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  # GET /subjects
  def index
    param_set
    @count	= Subject.notnil().includes(:p_name).search(params[:q]).result.count()
    @search	= Subject.notnil().includes(:p_name).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @subjects	= @search.result.per(50)
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
    reference_number_assign(params, "e_no", "e_no_form")
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
    
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
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
  # GET /subjects/1
  #def show
  #end

  # GET /subjects/new
  #def new
  #  @subject = Subject.new
  #end

  # GET /subjects/1/edit
  #def edit
  #end

  # POST /subjects
  #def create
  #  @subject = Subject.new(subject_params)

  #  if @subject.save
  #    redirect_to @subject, notice: 'Subject was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /subjects/1
  #def update
  #  if @subject.update(subject_params)
  #    redirect_to @subject, notice: 'Subject was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /subjects/1
  #def destroy
  #  @subject.destroy
  #  redirect_to subjects_url, notice: 'Subject was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def subject_params
      params.require(:subject).permit(:result_no, :generate_no, :e_no, :slash, :thrust, :stroke, :shot, :guard, :dance, :theft, :cooking, :technology, :movement, :chemistry, :arithmetic, :fire, :theology, :life, :demonology, :geography, :astronomy, :fengshui, :psychology, :music, :curse, :illusion, :trick)
    end
end
