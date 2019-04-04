class ArticlesController < ApplicationController
	def index
		@articles = Article.find(current_user.articles.ids)
	end

	def new
		@article = Article.new
	end

	def show
		@article = Article.find(params[:id])
	end

	def create
		@article = Article.new(article_params)
		if @article.save
		  redirect_to articles_path, notice: '記事を作成しました'
		else
			redirect_to new_article_path, notice: '記事を入力してください'
		end
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		article = Article.find(params[:id])
		article.update(article_params)
		redirect_to articles_path, notice: '記事を編集しました'
	end

	def destroy
		Article.delete(params[:id])
		redirect_to articles_path, notice: '記事を削除しました'
	end

	private

	def article_params
		params.require(:article).permit(:body, :topic).merge(user_id: current_user.id)
	end
end
