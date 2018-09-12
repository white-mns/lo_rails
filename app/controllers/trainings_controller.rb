class TrainingsController < ApplicationController
  include MyUtility
  before_action :set_training, only: [:show, :edit, :update, :destroy]

  # GET /trainings
  def index
    param_set
    @count	= Training.includes(:p_name).search(params[:q]).result.count()
    @search	= Training.includes(:p_name).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @trainings	= @search.result.per(50)
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
    reference_number_assign(params, "training_type", "training_type_form")
    reference_number_assign(params, "training", "training_form")
    
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @training_type_form = params["training_type_form"]
    @training_form = params["training_form"]
  end
  # GET /trainings/1
  #def show
  #end

  # GET /trainings/new
  #def new
  #  @training = Training.new
  #end

  # GET /trainings/1/edit
  #def edit
  #end

  # POST /trainings
  #def create
  #  @training = Training.new(training_params)

  #  if @training.save
  #    redirect_to @training, notice: 'Training was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /trainings/1
  #def update
  #  if @training.update(training_params)
  #    redirect_to @training, notice: 'Training was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /trainings/1
  #def destroy
  #  @training.destroy
  #  redirect_to trainings_url, notice: 'Training was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training
      @training = Training.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def training_params
      params.require(:training).permit(:result_no, :generate_no, :e_no, :training_type, :training)
    end
end
