class WelcomeController < ApplicationController
  before_action :authenticate_user! , only: [:order_summary, :search]
  def index
  end

  def show
  end

  def search

    dt    = params[:date].split(/,/)
    date  =  dt[2] + '-' + dt[0] + '-' + dt[1]
    @summary = Order.where(created_at: date)

  end

  def order_summary

  end
end
