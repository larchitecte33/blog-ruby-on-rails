class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :title, presence: true,
                    length: {minimum: 5}
                  
  after_destroy :log_destroy_action
  
  def log_destroy_action
    puts 'Article destroyed'
  end
end
