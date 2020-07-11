class Client < ApplicationRecord
  belongs_to :user
  has_many :chantiers
  has_many :commentaires, dependent: :destroy
  validates :telephone_2, phone: true

  include PgSearch::Model

  pg_search_scope :global_search,
    against: [ :categorie, :fidelite, :adresse ],
    using: {
      tsearch: { prefix: true }
    }
end
