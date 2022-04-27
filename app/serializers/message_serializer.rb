class MessageSerializer 
  def self.hashed(message) 
      {
        "data": {
          "type": "users",
          "id": nil,
          "attributes": {
            "error": {
              "message": message
            }
          }
        }
      }
  end 
end 