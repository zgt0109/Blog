class User::ArticlesController < ApplicationController
  before_action :set_article, only: [:show]

  def index
    @articles = Article.page params[:page]
  end

  def show
    @replies = Reply.all
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end
end
