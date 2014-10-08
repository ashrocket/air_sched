class InterlineCxrRulesController < ApplicationController
  before_action :set_interline_cxr_rule, only: [:show, :edit, :update, :destroy]

  # GET /interline_cxr_rules
  def index
    @interline_cxr_rules = InterlineCxrRule.all
  end

  # GET /interline_cxr_rules/1
  def show
  end

  # GET /interline_cxr_rules/new
  def new
     @report_key = ReportKey.keyed(params[:report_key_id])
     @interline_cxr_rule = @report_key.interline_cxr_rules.build
  end

  # GET /interline_cxr_rules/1/edit
  def edit
  end

  # POST /interline_cxr_rules
  def create
    byebug
    @report_key = ReportKey.keyed(params[:report_key_id])
    @interline_cxr_rule = @report_key.interline_cxr_rules.build(interline_cxr_rule_params)

    if @interline_cxr_rule.save
      redirect_to @interline_cxr_rule, notice: 'Interline cxr rule was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /interline_cxr_rules/1
  def update
    byebug
    if @interline_cxr_rule.update(interline_cxr_rule_params)
      redirect_to @interline_cxr_rule, notice: 'Interline cxr rule was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /interline_cxr_rules/1
  def destroy
    @interline_cxr_rule.destroy
    redirect_to interline_cxr_rules_url, notice: 'Interline cxr rule was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interline_cxr_rule
      @interline_cxr_rule = InterlineCxrRule.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def interline_cxr_rule_params
      params.require(:interline_cxr_rule).permit(:report_key_id, :markets, :combinations, :rule_kind, :active)
    end
end
