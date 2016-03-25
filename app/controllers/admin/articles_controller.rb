class Admin::ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = current_admin.articles.page params[:page]
    @arts = Article.all
    respond_to do |format|
      format.html
      format.csv { send_data @arts.to_csv }
      format.xls# { send_data @articles.to_csv(col_sep: "\t") }
    end
  end

  def search
    @articles = Article.where('content like ?', "%#{params[:search]}%")
    render partial: '/admin/articles/search'
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = current_admin.articles.build(article_params)
    respond_to do |format|
      if @article.save
        format.html { redirect_to [:admin,@article], notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to [:admin,@article], notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to admin_articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = current_admin.articles.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      # binding.pry
      params.require(:article).permit(:title, :content, :article_type_id, :tag_list)
    end

    def csv_content_for(objs)
      FasterCSV.generate do |csv|
        csv << ["Username", "Email"]

        objs.each do |record|
          csv << [
            record.login,
            record.email
           ]
        end

      end
    end
end
