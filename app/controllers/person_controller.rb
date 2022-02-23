class PersonController < ApplicationController
  # Sert à supprimer l'erreur InvalidAuthenticityToken
  skip_before_action :verify_authenticity_token
  
  def new
=begin
    texte = ''
    
    if Person.create(name: "Gauthier Dubourdieu").valid?
      texte = texte + 'true'
    else
      texte = texte + 'false'
    end
    
    texte = texte + ' '
    
    if Person.create(name: nil).valid?
      texte = texte + 'true'
    else
      texte = texte + 'false'
    end
    
    render :new, locals: {
      leTexte: texte
    }
=end
    
    #render :new
    
    #puts :name
    #puts :cbox1
  end
  
  def nouvelle
    Person.create(name: "Gauthier", terms_of_service: false)
  end
end
