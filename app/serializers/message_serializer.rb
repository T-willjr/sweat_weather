class MessageSerializer 
  class << self

    def hashed(message) 
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

    def hashed_login_error 
        {
          "data": {
            "type": "users",
            "id": nil,
            "attributes": {
              "error": {
                "message": "Your email or password is incorrect"
              }
            }
          }
        }
    end 

    def hashed_api_error
      {
          "data": {
            "type": "road_trip",
            "id": nil,
            "attributes": {
              "error": {
                "message": "Unauthorized api key"
            }
          }
        }
      }
    end 
  end 
end 