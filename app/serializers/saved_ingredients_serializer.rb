class SavedIngredientsSerializer
  include JSONAPI::Serializer
  attributes :uid
  has_many :ingredients
end

