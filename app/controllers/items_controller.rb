class ItemsController < ApplicationController
  include MyUtility
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  def index
    param_set
    @count	= Item.notnil().includes(:p_name, :equip_name, :kind_name, :effect_name, [detail: :major_name]).search(params[:q]).result.count()
    @search	= Item.notnil().includes(:p_name, :equip_name, :kind_name, :effect_name, [detail: :major_name]).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @items	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')
    
    params[:q] ||= {}
    if !params["is_form"] then
        params["result_no_form"] ||= sprintf('%d',@last_result)
    end
    
    if params["kind_equip"] == "on" then
        if params["kind_form"] then
            params["kind_form"] = params["kind_form"].match(/器\/防具\/衣服\/装飾\/護符/) ? params["kind_form"] : params["kind_form"] + "器/防具/衣服/装飾/護符"
        else
            params["kind_form"] = "器/防具/衣服/装飾/護符"
        end
    end

    reference_text_assign(params, "p_name_name", "p_name_form")
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "e_no", "e_no_form")
    reference_number_assign(params, "i_no", "i_no_form")
    reference_text_assign(params, "name", "name_form")
    reference_text_assign(params, "equip_name_name", "equip_form")
    reference_text_assign(params, "kind_name_name", "kind_form")
    reference_text_assign(params, "effect_name_name", "effect_form")
    reference_number_assign(params, "lv", "lv_form")
    reference_number_assign(params, "potency", "potency_form")
    reference_text_assign(params, "potency_str", "potency_str_form")
    reference_number_assign(params, "precision", "precision_form")
    reference_text_assign(params, "detail_major_name_name", "major_form")
    
    if params["exist_effect"] == "on" then
       if params[:q]["effect_name_name_not_cont"] then
           params[:q]["effect_name_name_not_cont"] = (params[:q]["effect_name_name_not_cont"].match(/-/)) ? params[:q]["effect_name_name_not_cont"] : params[:q]["effect_name_name_not_cont"] + " -"
       else
           params[:q]["effect_name_name_not_cont"] = "-"
       end
    end
    
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @i_no_form = params["i_no_form"]
    @name_form = params["name_form"]
    @equip_form = params["equip_form"]
    @kind_form = params["kind_form"]
    @effect_form = params["effect_form"]
    @lv_form = params["lv_form"]
    @potency_form = params["potency_form"]
    @potency_str_form = params["potency_str_form"]
    @precision_form = params["precision_form"]
    @major_form = params["major_form"]

    @exist_effect = params["exist_effect"]
    @kind_equip = params["kind_equip"]

    @show_facility_division = params["show_facility_division"]
  end
  # GET /items/1
  #def show
  #end

  # GET /items/new
  #def new
  #  @item = Item.new
  #end

  # GET /items/1/edit
  #def edit
  #end

  # POST /items
  #def create
  #  @item = Item.new(item_params)

  #  if @item.save
  #    redirect_to @item, notice: 'Item was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /items/1
  #def update
  #  if @item.update(item_params)
  #    redirect_to @item, notice: 'Item was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /items/1
  #def destroy
  #  @item.destroy
  #  redirect_to items_url, notice: 'Item was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:result_no, :generate_no, :e_no, :i_no, :name, :equip, :kind, :effect, :lv, :potency, :potency_str, :precision)
    end
end
