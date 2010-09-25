class CurrencyValuesController < ApplicationController
  # GET /currency_values
  # GET /currency_values.xml
  def index
    @currency_values = CurrencyValue.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @currency_values }
    end
  end

  # GET /currency_values/1
  # GET /currency_values/1.xml
  def show
    @currency_value = CurrencyValue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @currency_value }
    end
  end

  # GET /currency_values/new
  # GET /currency_values/new.xml
  def new
    @currency_value = CurrencyValue.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @currency_value }
    end
  end

  # GET /currency_values/1/edit
  def edit
    @currency_value = CurrencyValue.find(params[:id])
  end

  # POST /currency_values
  # POST /currency_values.xml
  def create
    @currency_value = CurrencyValue.new(params[:currency_value])

    respond_to do |format|
      if @currency_value.save
        flash[:notice] = 'CurrencyValue was successfully created.'
        format.html { redirect_to(@currency_value) }
        format.xml  { render :xml => @currency_value, :status => :created, :location => @currency_value }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @currency_value.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /currency_values/1
  # PUT /currency_values/1.xml
  def update
    @currency_value = CurrencyValue.find(params[:id])

    respond_to do |format|
      if @currency_value.update_attributes(params[:currency_value])
        flash[:notice] = 'CurrencyValue was successfully updated.'
        format.html { redirect_to(@currency_value) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @currency_value.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /currency_values/1
  # DELETE /currency_values/1.xml
  def destroy
    @currency_value = CurrencyValue.find(params[:id])
    @currency_value.destroy

    respond_to do |format|
      format.html { redirect_to(currency_values_url) }
      format.xml  { head :ok }
    end
  end
end
