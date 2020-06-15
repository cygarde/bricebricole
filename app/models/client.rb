class Client < ApplicationRecord
  belongs_to :user

  include PgSearch::Model
  pg_search_scope :search_by_categorie,
    against: [ :categorie ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
