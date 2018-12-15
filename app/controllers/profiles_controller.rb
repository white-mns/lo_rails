class ProfilesController < ApplicationController
  include MyUtility
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profiles
  def index
    param_set
    @count	= Profile.notnil().includes(:p_name, :tone_name).search(params[:q]).result.count()
    @search	= Profile.notnil().includes(:p_name, :tone_name).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @profiles	= @search.result.per(50)
  end
  
  def pgws
    param_set
    @count	= Profile.notnil().includes(:p_name, [potential1: :pgws_name], [potential2: :pgws_name], [good1: :pgws_name], [good2: :pgws_name], [weak1: :pgws_name], [weak2: :pgws_name], [speciality1: :pgws_name], [speciality2: :pgws_name]).search(params[:q]).result.count()
    @search	= Profile.notnil().includes(:p_name, [potential1: :pgws_name], [potential2: :pgws_name], [good1: :pgws_name], [good2: :pgws_name], [weak1: :pgws_name], [weak2: :pgws_name], [speciality1: :pgws_name], [speciality2: :pgws_name]).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @profiles	= @search.result.per(50)
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
    reference_text_assign(params, "nickname", "nickname_form")
    reference_text_assign(params, "tone_name_name", "tone_form")
    reference_text_assign(params, "first", "first_form")
    reference_text_assign(params, "second", "second_form")
    reference_text_assign(params, "potential1_pgws_name_name", "potential1_form")
    reference_text_assign(params, "potential2_pgws_name_name", "potential2_form")
    reference_text_assign(params, "good1_pgws_name_name", "good1_form")
    reference_text_assign(params, "good2_pgws_name_name", "good2_form")
    reference_text_assign(params, "weak1_pgws_name_name", "weak1_form")
    reference_text_assign(params, "weak2_pgws_name_name", "weak2_form")
    reference_text_assign(params, "speciality1_pgws_name_name", "speciality1_form")
    reference_text_assign(params, "speciality2_pgws_name_name", "speciality2_form")
    
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @nickname_form = params["nickname_form"]
    @tone_form = params["tone_form"]
    @first_form = params["first_form"]
    @second_form = params["second_form"]
    @potential1_form = params["potential1_form"]
    @potential2_form = params["potential2_form"]
    @good1_form = params["good1_form"]
    @good2_form = params["good2_form"]
    @weak1_form = params["weak1_form"]
    @weak2_form = params["weak2_form"]
    @speciality1_form = params["speciality1_form"]
    @speciality2_form = params["speciality2_form"]
  end
  # GET /profiles/1
  #def show
  #end

  # GET /profiles/new
  #def new
  #  @profile = Profile.new
  #end

  # GET /profiles/1/edit
  #def edit
  #end

  # POST /profiles
  #def create
  #  @profile = Profile.new(profile_params)

  #  if @profile.save
  #    redirect_to @profile, notice: 'Profile was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /profiles/1
  #def update
  #  if @profile.update(profile_params)
  #    redirect_to @profile, notice: 'Profile was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /profiles/1
  #def destroy
  #  @profile.destroy
  #  redirect_to profiles_url, notice: 'Profile was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def profile_params
      params.require(:profile).permit(:result_no, :generate_no, :e_no, :nickname, :tone, :first, :second)
    end
end
