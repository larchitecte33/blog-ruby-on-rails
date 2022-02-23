class CommentsController < ApplicationController
  # On autorise seulement les utilisateurs authentifiés à exécuter l'action destroy
  http_basic_authenticate_with name: "aut", password: "pass", only: :destroy
  
  def create
    # On crée le commentaire via l'article
    # Ceci permet de lier le commentaire à l'article
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end
  
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
  
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
