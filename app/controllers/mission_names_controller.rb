class MissionNamesController < ApplicationController
  include MyUtility
  before_action :set_mission_name, only: [:show, :edit, :update, :destroy]

  # GET /mission_names
  def index
    param_set
    @count	= MissionName.search(params[:q]).result.count()
    @search	= MissionName.page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @mission_names	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')
    
    params[:q] = {}
    if !params["is_form"] then
        params["result_no_form"] ||= sprintf('%d',@last_result)
    end
    
    reference_text_assign(params, "p_name_name", "p_name_form")
    reference_number_assign(params, "mission_id", "mission_id_form")
    reference_text_assign(params, "name", "name_form")
    
    @p_name_form = params["p_name_form"]
    @mission_id_form = params["mission_id_form"]
    @name_form = params["name_form"]
  end
  # GET /mission_names/1
  #def show
  #end

  # GET /mission_names/new
  #def new
  #  @mission_name = MissionName.new
  #end

  # GET /mission_names/1/edit
  #def edit
  #end

  # POST /mission_names
  #def create
  #  @mission_name = MissionName.new(mission_name_params)

  #  if @mission_name.save
  #    redirect_to @mission_name, notice: 'Mission name was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /mission_names/1
  #def update
  #  if @mission_name.update(mission_name_params)
  #    redirect_to @mission_name, notice: 'Mission name was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /mission_names/1
  #def destroy
  #  @mission_name.destroy
  #  redirect_to mission_names_url, notice: 'Mission name was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mission_name
      @mission_name = MissionName.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def mission_name_params
      params.require(:mission_name).permit(:mission_id, :name)
    end
end
