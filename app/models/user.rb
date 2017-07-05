class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  enumerize :profile, in: [:admin, :common], default: :common, predicates: true, scope: true

  scope :active, -> { where(active: true) }

  def active_for_authentication?
    active?
  end
end
