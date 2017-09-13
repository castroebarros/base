class Client < ApplicationRecord
  validates :name, presence: true

  has_many :phones, as: :callable, dependent: :delete_all
  accepts_nested_attributes_for :phones, allow_destroy: true

  has_many :emails, as: :emailable, dependent: :delete_all
  accepts_nested_attributes_for :emails, allow_destroy: true

  scope :search,  -> (q) { where("name ilike '%' || ? || '%'", q).by_name }
  scope :by_name, -> { order('name ASC') }
end
