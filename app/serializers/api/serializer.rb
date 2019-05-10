class Api::Serializer
  include FastJsonapi::ObjectSerializer

  def self.serializer_array(collection)
    self.new(collection, is_collection: true)
      .serializable_hash[:data].map do |serialized_item|
        serialized_item[:attributes]
      end
  end
end
