class ArticlesController < ApplicationController
  include ArticlesHelper

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])

    @comment = Comment.new
    @comment.article_id = @article.id
    

  end

  def new
    @article = Article.new


  end

  def edit
    @article = Article.find(params[:id])
  end

  def create

    #This was the first way to add data through the form
    #that was shown.
    #@article = Article.new
    #@article.title = params[:article][:title]
    #@article.body = params[:article][:body]


    #This is the second way passing params as a hash
    #@article = Article.new(
    #  title: params[:article][:title],
    #  body: params[:article][:body]


    #This can be used after the right code is added to the
    #article_helper class.
    @article = Article.new(article_params)


    @article.save
    flash.notice = "Article '#{@article.title}' was created!"

    redirect_to article_path(@article)
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    flash.notice = "Article '#{@article.title}' was deleted!"

    redirect_to action: "index"
  end
end
