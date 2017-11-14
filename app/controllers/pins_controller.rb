class PinsController < ApplicationController
	before_action :require_login
	def index
		@pin = Pin.all
	end
	def show
		@pin = Pin.find(params[:id])
	end
	def destroy
		@pin = Pin.find(params[:id])
		@pin.destroy
		@pins = Pin.all
	end
end
