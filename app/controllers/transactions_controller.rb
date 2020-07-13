class TransactionsController < ApplicationController
  def index
    @transactions = policy_scope(Transaction)
  end

  def new
    callGenerator = BillingDayCallGenerator.new()
    
    if callGenerator.transaction? == true
      flash[:notice] = "Transactions added"
    else
      flash[:alert] = "Transactions not added"
    end
    redirect_to "/transactions"
  end
end
