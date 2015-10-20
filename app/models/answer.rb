class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  # has_one :vote
  has_many :votes, as: :votable

  # validates :content, :presence => true
  validates_presence_of :content

def vote_count
  total = 0
  self.votes.each do |vote|
    total += vote.vote
  end
  return total
end

default_scope {order('created_at DESC')}
end
