class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    @user.save
    
    redirect_to articles_path
  end
  
  def get_all
    @users = User.all
  end
  
  def get_first
    @user = User.first
  end
  
  def find_by
    @user = User.find_by(nom: 'Aude')
  end
  
  def where
    # Renvoie tous les utilisateurs nommés Bernard qui sont cariste et ordonnés
    # par created_at décroissant
    @users = User.where(nom: 'Bernard', profession: 'Cariste').order(created_at: :desc)
  end
  
  def update
    user = User.find_by(nom: 'Aude', profession: 'Comptable')
    
    if user
      user.nom = "Karine"
      user.save
    end
  end
  
  def delete
    user = User.find_by(nom: 'Karine')
    user.destroy
  end
  
  private
    def user_params
      params.require(:user).permit(:nom, :profession, :email)
    end
end
