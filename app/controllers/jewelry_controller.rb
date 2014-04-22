class JewelryController < ApplicationController

  layout 'jewelry'

	def index
    @page = params[:page] || 1
    render "index_#{@page}"
	end

end
