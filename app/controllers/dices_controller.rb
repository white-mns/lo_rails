class DicesController < ApplicationController
  include MyUtility
  before_action :set_dice, only: [:show, :edit, :update, :destroy]

  # GET /dices
  def index
    placeholder_set
    param_set
    @count	= Dice.notnil().includes(:p_name).search(params[:q]).result.count()
    @search	= Dice.notnil().includes(:p_name).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @dices	= @search.result.per(50)
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
    reference_number_assign(params, "number", "number_form")
    reference_number_assign(params, "dice", "dice_form")
    reference_number_assign(params, "use_item", "use_item_form")
    
    if params["use_card"]  == "on" then params[:q]["use_item_eq_any"] = [1,2,3,4,5,6] end
    if params["no_item"]   == "on" then params[:q]["use_item_eq_any"] = 0 end
    if params["use_card"]  == "on" && params["no_item"] then params[:q]["use_item_eq_any"] = "" end

    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @number_form = params["number_form"]
    @dice_form = params["dice_form"]
    @use_item_form = params["use_item_form"]

    @use_card = params["use_card"]
    @no_item = params["no_item"]
  end
  # GET /dices/1
  #def show
  #end

  # GET /dices/new
  #def new
  #  @dice = Dice.new
  #end

  # GET /dices/1/edit
  #def edit
  #end

  # POST /dices
  #def create
  #  @dice = Dice.new(dice_params)

  #  if @dice.save
  #    redirect_to @dice, notice: 'Dice was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /dices/1
  #def update
  #  if @dice.update(dice_params)
  #    redirect_to @dice, notice: 'Dice was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /dices/1
  #def destroy
  #  @dice.destroy
  #  redirect_to dices_url, notice: 'Dice was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dice
      @dice = Dice.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dice_params
      params.require(:dice).permit(:result_no, :generate_no, :e_no, :number, :dice, :use_item)
    end
end
