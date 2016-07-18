class ArticlesController < ApplicationController

	#GET /articles
	def index
		#Trae todos los registros de articles
		#@articles es una variable de clase, se puede acceder desde la vista y el controlador
		@articles = Article.all
	end

	#GET /articles/:id
	def show
		@article = Article.find(params[:id])
	end

	#GET /articles/new
	def new
		@article = Article.new
	end

	#POST /articles
	def create
		@article = Article.new(article_params)

		if @article.save
			redirect_to @article
		else
			render :new
		end
	end

	def edit
		@article = Article.find(params[:id])
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end

	#PUT /articles/:id
	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render :edit
		end
	end

	private

	def article_params
		params.require(:article).permit(:title, :body)
	end

end







