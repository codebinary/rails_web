class ArticlesController < ApplicationController
	#GET /articles
    def index
        #Obtiene todos los registros de la tabla article
    	@articles = Article.all
    end

    #GET /articles/:id
    def show
        #Encuentra un article por el id
    	@article = Article.find(params[:id])
        #Where
        #Article.where.not("id = ?", params[:id])
    end

    #GET /articles/new
    def new
        #Crea un nuevo article
        @article = Article.new
    end 

    #GET /articles/:id
    def edit
        @article = Article.find(params[:id])
    end

    #PUT /articles/:id
    def update
        #@article.update_attributes({title: "Nuevo título"})
        @article = Article.find(params[:id])
        if @article.update(article_atributes)
            redirect_to @article
        else
            return :edit
        end
    end
    
    #POST /articles
    def create
        @article = Article.new(article_atributes)
        #@article.invalid?
        if @article.save
            redirect_to @article
        else
            render :new
        end
    end

  
    def destroy
        @article = Article.find(params[:id])
        @article.destroy #Elimina el objeto de la base de datos
        redirect_to articles_path
    end

    private
    
    def article_atributes
        params.require(:article).permit(:title,:body)
    end
    
end