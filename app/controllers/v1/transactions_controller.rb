# frozen_string_literal: true

module V1
  class TransactionsController < ApplicationController
    before_action :set_transaction, only: [:show, :update]

    # GET /transactions
    def index
      @transactions = Transaction.paginate(page: params[:page], per_page: 10)
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

    # PUT /transactions/:id
    def update
      @transaction.update!(transaction_params)
      head :no_content
    end

    private

    def transaction_params
      params.require(:transaction).permit(:created_by_id, :input_amount_currency, :input_amount_cents,
        :output_amount_currency, :output_amount_cents, :date_of_transaction)
    end

    def set_transaction
      @transaction = Transaction.find(params[:id])
    end
  end
end
