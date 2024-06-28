class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  def my_account
    @item = ListedItem.new
    @items = ListedItem.all
    @transactions = Transaction.all
  end
end
