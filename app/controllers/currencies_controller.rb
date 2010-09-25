class CurrenciesController < ApplicationController
  layout 'application'

  def index
    @currencies = Currency.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @currencies }
    end
  end

  def show
    @currency = Currency.find_by_name params[:currency][:currency_name]
    @chart    = HighChart.new 'graph' do |h|
      currency_values = @currency.currency_values[0..20]
      h.title   :text => ''
      h.series  :name => @currency.name, :data => currency_values.map {|cv| cv.value.to_f}
      h.chart   :zoomType => 'x'

      h.options[:chart  ][:height]        = '400'
      h.options[:x_axis ][:categories]    = currency_values.map {|cv| cv.date_bid.strftime '%Y-%m-%d'}
      h.options[:y_axis ][:title][:text]  = 'Value'
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @currency }
    end
  end

  def new
    @currency = Currency.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @currency }
    end
  end

  def edit
    @currency = Currency.find_by_name params[:id]
  end

  def create
    @currency = Currency.new(params[:currency])

    respond_to do |format|
      if @currency.save
        flash[:notice] = 'Currency was successfully created.'
        format.html { redirect_to(@currency) }
        format.xml  { render :xml => @currency, :status => :created, :location => @currency }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @currency.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @currency = Currency.find_by_name params[:id]

    respond_to do |format|
      if @currency.update_attributes(params[:currency])
        flash[:notice] = 'Currency was successfully updated.'
        format.html { redirect_to(@currency) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @currency.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @currency = Currency.find_by_name params[:id]
    @currency.destroy

    respond_to do |format|
      format.html { redirect_to(currencies_url) }
      format.xml  { head :ok }
    end
  end
end
