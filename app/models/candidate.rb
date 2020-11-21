class Candidate < ApplicationRecord
  has_many :bagdes


  include PgSearch::Model
  pg_search_scope :search_by_candidate_ballot_name_and_party_candidate,
    against: [[ :candidate_ballot_name, 'A'],
              [:party_candidate, 'C']],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
