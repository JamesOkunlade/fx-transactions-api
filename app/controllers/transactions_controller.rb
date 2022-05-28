class TransactionsController < ApplicationController
  before_action  :set_transaction, only: :show

  # GET /transactions
  def index
    @transactions = Transaction.all
    json_response(@transactions)
  end

  # POST /transactions
  def create
    @transaction = Transaction.create!(transaction_params)
    json_response(@transaction, :created)
  end

  # GET /transactions/:id
  def show
    json_response(@transaction)
  end

  private

  def transaction_params
    params.require(:transaction).permit(:created_by_id, :input_amount_currency, :input_amount, 
      :output_amount_currency, :output_amount, :date_of_transaction)
  end

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end
end