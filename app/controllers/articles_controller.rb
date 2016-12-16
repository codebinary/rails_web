class ArticlesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]#Helpder que viene con devise
    before_action :article_find, except: [:index, :new, :create]

	#GET /articles
    def index
        #Obtiene todos los registros de la tabla article
    	@articles = Article.all
    end
    
    #GET /articles/:id
    def show
        @comment = Comment.new
    end

    #GET /articles/new
    def new
        #Crea un nuevo article
        @article = Article.new
    end 

    #GET /articles/:id
    def edit
        
    end

    #PUT /articles/:id
    def update
        #@article.update_attributes({title: "Nuevo título"})
        if @article.update(article_atributes)
            redirect_to @article
        else
            return :edit
        end
    end
    
    #POST /articles
    def create
        @article = current_user.articles.new(article_atributes)
        #@article.invalid?
        if @article.save
            redirect_to @article
        else
            render :new
        end
    end

  
    def destroy
        
        @article.destroy #Elimina el objeto de la base de datos
        redirect_to articles_path
    end

    private

    def article_find
        @article = Article.find(params[:id])
    end
    
    def article_atributes
        params.require(:article).permit(:title,:body)
    end
    
end