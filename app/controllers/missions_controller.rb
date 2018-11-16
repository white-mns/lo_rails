class MissionsController < ApplicationController
  include MyUtility
  before_action :set_mission, only: [:show, :edit, :update, :destroy]

  # GET /missions
  def index
    param_set
    @count	= Mission.notnil().includes(:p_name, :mission).search(params[:q]).result.count()
    @search	= Mission.notnil().includes(:p_name, :mission).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @missions	= @search.result.per(50)
  end

  # GET /mission/statistics
  def statistics
    param_set
    @count	 = Mission.notnil().includes(:p_name, :mission).search(params[:q]).result.count()
    @search	 = Mission.notnil().includes(:p_name, :mission)
                                .where(mission_type: 0)
                                .group(:result_no, :mission_id)
                                .select("*").select("count(*) AS count").select("
                                    max(lv) AS lv,
                                    count(status = 1 or null) AS status_clear,
                                    count(status = 1 or null) / count(*) AS clear_per
                                    ")
                                .page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @missions	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')
    
    params_clean(params)
    if !params["is_form"] then
        params["result_no_form"] ||= sprintf('%d',@last_result)
    end
    
    reference_text_assign(params, "p_name_name", "p_name_form")
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "e_no", "e_no_form")
    reference_number_assign(params, "mission_id", "mission_id_form")
    reference_number_assign(params, "mission_type", "mission_type_form")
    reference_number_assign(params, "status", "status_form")
    reference_text_assign(params, "col", "col_form")
    reference_number_assign(params, "lv", "lv_form")

    reference_text_assign(params, "mission_name", "mission_name_form")
    
    params[:q]["mission_type_eq_any"] ||= []
    if !params["is_form"] then params["type_normal"]  = "on" end
    if params["type_normal"]     == "on" then params[:q]["mission_type_eq_any"].push(0) end
    if params["type_additional"] == "on" then params[:q]["mission_type_eq_any"].push(1) end

    params[:q]["status_eq_any"] ||= []
    if !params["is_form"] then
        params["status_receiving"]  = "on"
        params["status_clear"]      = "on"
        params["status_lost"]       = "on"
    end

    if params["status_receiving"]  == "on" then params[:q]["status_eq_any"].push(0)  end
    if params["status_clear"]      == "on" then params[:q]["status_eq_any"].push(1)  end
    if params["status_lost"]       == "on" then params[:q]["status_eq_any"].push(-1) end
    
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @mission_id_form = params["mission_id_form"]
    @mission_type_form = params["mission_type_form"]
    @status_form = params["status_form"]
    @col_form = params["col_form"]
    @lv_form = params["lv_form"]

    @mission_name_form = params["mission_name_form"]
    @status_receiving = params["status_receiving"]
    @status_clear = params["status_clear"]
    @status_lost = params["status_lost"]
    @type_normal = params["type_normal"]
    @type_additional = params["type_additional"]
  end
  # GET /missions/1
  #def show
  #end

  # GET /missions/new
  #def new
  #  @mission = Mission.new
  #end

  # GET /missions/1/edit
  #def edit
  #end

  # POST /missions
  #def create
  #  @mission = Mission.new(mission_params)

  #  if @mission.save
  #    redirect_to @mission, notice: 'Mission was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /missions/1
  #def update
  #  if @mission.update(mission_params)
  #    redirect_to @mission, notice: 'Mission was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /missions/1
  #def destroy
  #  @mission.destroy
  #  redirect_to missions_url, notice: 'Mission was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mission
      @mission = Mission.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def mission_params
      params.require(:mission).permit(:result_no, :generate_no, :e_no, :mission_id, :mission_type, :status, :col, :lv)
    end
end
