class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :job
  validates_uniqueness_of :job_id, scope: :user_id
end
