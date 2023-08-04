class Ingredient
   attr_accessor :id,
               :name,
               :unit_type,
               :units
  def initialize(data = {})
    @id = data[:id]
    @name = data[:name]
    @unit_type = data[:unit_type]
    @units = data[:units]
  end
end