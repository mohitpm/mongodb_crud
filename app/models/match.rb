class Match
  include Mongoid::Document
  field :name, type: String
  field :venue, type: String
  field :played_on, type: Date
  embedded_in :game, :inverse_of => :matches

  validates :name, :venue, :played_on, presence: true

end
