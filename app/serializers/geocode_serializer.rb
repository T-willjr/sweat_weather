class GeocodeSerializer
  include JSONAPI::Serializer
  attributes :id, :latLng

end