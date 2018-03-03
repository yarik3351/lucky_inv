class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]
  before_action :last_invoice, only: [:new]
  # before_action :check_authentication
  #
  # def check_authentication
  #   redirect_to login_path unless logged_in?
  # end

  # GET /invoices
  # GET /invoices.json
  def index
    #@invoices = Invoice.all#Invoice.search(params[:term], params[:page])
    # @invoices = Invoice.paginate(:page => params[:page]).order('id DESC')
    @invoices = Invoice.page(params[:page]).order('id DESC')
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  # GET /invoices/new.json (last invoice)
  def new
    @invoice = @last_invoice ? Invoice.new(@last_invoice.attributes.except('number')) : Invoice.new
    respond_to do |format|
        format.html {}
        format.json { render json: @last_invoice, status: :ok, location: @last_invoice }
      end

  end

  # GET /invoices/1/edit
  # GET /invoices/1/edit.json (current invoice)
  def edit
    respond_to do |format|
      format.html {}
      format.json { render json: @invoice, status: :ok, location: @invoice }
    end

  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end
    def last_invoice
      @last_invoice = Invoice.last
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:number, :date, :user_id,
                                      :customer_id, :saved_user, :saved_customer,
                                      :saved_bank_credentials, :status, :amount,
                                      :currency, :items)
    end
end
