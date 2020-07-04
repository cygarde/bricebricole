class Chantier < ApplicationRecord
  belongs_to :client
  belongs_to :user
  has_many_attached :photos
  has_many :taches, class_name: 'Tache', dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model

  pg_search_scope :search_by_statut,
    against: [ :statut ],
    using: {
      tsearch: { prefix: true }
    }

end
