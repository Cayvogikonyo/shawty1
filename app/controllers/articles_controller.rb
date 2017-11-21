class ArticlesController < ApplicationController
include ArticlesHelper
before_action :require_login	
	def index
		@articles = Article.all.order(created_at: :desc)
	end
	def show
		@article = Article.find(params[:id])
	end
	def new
		@article = Article.new
		@pins = Pin.all.map {|t| [t.name]}
		respond_to do |format|
			format.html
			format.xml { render :xml => @article }
		end
	end
	def create
		@article = Article.new(article_params)
		@article.save
		flash.notice = "Post '#{@article.title}' has Been Created"

		redirect_to action: "index"
	end
	def edit
		@article = Article.find(params[:id])
		@pins = Pin.all.map {|t| [t.name]}
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		flash.notice = "Post Deleted"

		redirect_to action: "index"
	end
	def update 
		@article = Article.find(params[:id])
		@article.update(article_params)

		flash.notice = "Your Post has Been Updated"

		redirect_to article_path(@article)
	end

end
