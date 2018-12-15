class PreWinsController < ApplicationController
  include MyUtility
  before_action :set_pre_win, only: [:show, :edit, :update, :destroy]

  # GET /pre_wins
  def index
    param_set
    @count	= PreWin.notnil().includes(:p_name).search(params[:q]).result.count()
    @search	= PreWin.notnil().includes(:p_name).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @pre_wins	= @search.result.per(50)
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
    reference_number_assign(params, "win", "win_form")
    reference_number_assign(params, "draw", "draw_form")
    reference_number_assign(params, "lose", "lose_form")
    reference_number_assign(params, "all", "all_form")
    
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @win_form = params["win_form"]
    @draw_form = params["draw_form"]
    @lose_form = params["lose_form"]
    @all_form = params["all_form"]
  end
  # GET /pre_wins/1
  #def show
  #end

  # GET /pre_wins/new
  #def new
  #  @pre_win = PreWin.new
  #end

  # GET /pre_wins/1/edit
  #def edit
  #end

  # POST /pre_wins
  #def create
  #  @pre_win = PreWin.new(pre_win_params)

  #  if @pre_win.save
  #    redirect_to @pre_win, notice: 'Pre win was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /pre_wins/1
  #def update
  #  if @pre_win.update(pre_win_params)
  #    redirect_to @pre_win, notice: 'Pre win was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /pre_wins/1
  #def destroy
  #  @pre_win.destroy
  #  redirect_to pre_wins_url, notice: 'Pre win was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pre_win
      @pre_win = PreWin.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pre_win_params
      params.require(:pre_win).permit(:result_no, :generate_no, :e_no, :win, :draw, :lose, :all)
    end
end
