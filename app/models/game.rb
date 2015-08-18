class Game
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  embeds_many :matches

  validates :name, presence: true

  accepts_nested_attributes_for :matches
end
