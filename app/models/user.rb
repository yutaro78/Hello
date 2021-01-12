class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :jobs, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :username, presence: true

  def already_favorited?(job)
    self.favorites.exists?(job_id: job.id)
  end
end
