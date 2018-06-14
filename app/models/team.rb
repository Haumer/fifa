class Team < ApplicationRecord
  acts_as_votable
  belongs_to :group
end
