class Chantier < ApplicationRecord
  belongs_to :client
  belongs_to :user
  has_many_attached :photos
  has_many :taches, dependent: :destroy
end
