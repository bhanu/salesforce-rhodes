require 'rho/rhocontroller'
require 'helpers/browser_helper'

class AccountController < Rho::RhoController
  include BrowserHelper

  # GET /Account
  def index
    @accounts = Account.find(:all).sort_by { |a| a.Name }
    puts "### @accounts: #{@accounts.size} -- #{@accounts.first.class} -- #{@accounts.first.inspect}"
    render :back => '/app'
  end

  # GET /Account/{1}
  def show
    @account = Account.find(@params['id'])
    if @account
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Account/new
  def new
    @account = Account.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Account/{1}/edit
  def edit
    @account = Account.find(@params['id'])
    if @account
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Account/create
  def create
    @account = Account.create(@params['account'])
    redirect :action => :index
  end

  # POST /Account/{1}/update
  def update
    @account = Account.find(@params['id'])
    @account.update_attributes(@params['account']) if @account
    redirect :action => :index
  end

  # POST /Account/{1}/delete
  def delete
    @account = Account.find(@params['id'])
    @account.destroy if @account
    redirect :action => :index  
  end
end
