class User < ActiveRecord::Base
  validates :nom, :email, presence: true
  has_many :articles, dependent: :destroy
  
  before_validation :ensure_nom_has_a_value
  
  after_initialize do |user|
    puts "You have initialized an object!"
  end
  
  after_find do |user|
    puts "You have found an object !!!"
  end
  
  after_touch do |user|
    puts "You have touched an object"
  end
  
  protected
    def ensure_nom_has_a_value
      if nom.blank?
        self.nom = email unless email.blank?
      end
    end
end
