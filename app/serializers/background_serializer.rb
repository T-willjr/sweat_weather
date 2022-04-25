class BackgroundSerializer 
  def self.hashed(background_data) 
  {
    "data": {
      "type": "image",
      "id": nil,
      "attributes": {
        "image": {
          "location": background_data[:queryContext][:originalQuery],
          "image_url": background_data[:value].first[:thumbnailUrl]
        }
      }
  }
}
  end 
end 