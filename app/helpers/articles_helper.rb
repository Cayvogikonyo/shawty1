module ArticlesHelper
	def article_params
		params.require(:article).permit(:title, :body, :pin_list)
	end
end
