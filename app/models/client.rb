class Client < ApplicationRecord
  belongs_to :user
  has_many :chantiers

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :categorie, :fidelite, :adresse ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }


end
