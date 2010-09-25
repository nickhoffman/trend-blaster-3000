class NyTimesController < ApplicationController
  def search
    render :text => NYTimes.search(params[:date]).to_json
  end
end
