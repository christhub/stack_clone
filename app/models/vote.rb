class Vote < ActiveRecord::Base
  # belongs_to :user
  #
  # validates :user, uniqueness: true
  # validates :answer, uniqueness: true
  belongs_to :votable, polymorphic: true

end
