class Api::Serializer
  include FastJsonapi::ObjectSerializer

  def self.serializer_array(collection)
    self.new(collection, is_collection: true)
      .serializable_hash[:data].map do |serialized_item|
        serialized_item[:attributes]
      end
  end

  def self.serialize(object)
    self.new(object, is_collection: false)
      .serializable_hash[:data][:attributes]
  end
end
