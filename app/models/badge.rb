class Badge < ApplicationRecord
  belongs_to :candidate
  belongs_to :user

  # validate scope: não pode ter outro badge com um mesmo nome, candidato e user
  # validates :name, uniqueness: { scope: :user_id }
  validates :name, uniqueness: { scope: [:candidate_id, :user_id] }
end
