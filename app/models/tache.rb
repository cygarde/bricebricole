class Tache < ApplicationRecord
  belongs_to :chantier
  belongs_to :user
end
