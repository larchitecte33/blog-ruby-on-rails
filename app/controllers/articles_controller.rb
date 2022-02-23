class ArticlesController < ApplicationController
  # On autorise seulement les utilisateurs authentifiés à exécuter les actions suivantes
  # excepté les actions index et show
  http_basic_authenticate_with name: "aut", password: "pass", except: [:index, :show]
  
  # Les méthodes qui suivent sont des actions standards CRUD(Create, Read, Update et Delete).
  # Elles doivent être placées avant toutes méthode private et protected.
  
  # Une pratique courante est de placer les actions CRUD dans l'ordre suivant :
  # index, show, new, edit, create, update, destroy
  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def new
    @article = Article.new
  end
  
  def edit
    @article = Article.find(params[:id])
  end

  def create
    # Utilisé pour afficher les champs et les valeurs
    #render plain: params[:article].inspect

    # Le modèle est d'abord initialisé avec ses attributs respectifs, qui sont
    # automatiquement associés aux colonnes respectives de la base
    @article = Article.new(article_params)

    # Sauvegarde du modèle en base
    if @article.save
      # Redirection vers l'action show
      redirect_to @article
    else
      render 'new'
    end
  end
  
  def update
    @article = Article.find(params[:id])
    
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    
    # articles_path => correspond à la route dont le préfixe est articles
    # voir ruby bin\rake routes
    redirect_to articles_path
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
