class SavedIngredientsSerializer
  include JSONAPI::Serializer

  attribute :pizza do |object|
    require 'pry'; binding.pry
  end           
end

