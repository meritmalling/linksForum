class Post < ActiveRecord::Base
  belongs_to :user

  validates :title,
  presence: true,
  length: { minimum: 10, maximum: 100 }

  validates :link,
  presence: true

  belongs_to :user
  has_many :votes, as: :votable

def post_author user
  user && user.id == self.user.id
end

end
