class Client < ApplicationRecord
  belongs_to :user
  has_many :chantiers

  include PgSearch::Model

  pg_search_scope :search_by_categorie,
    against: [ :categorie ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }


end
