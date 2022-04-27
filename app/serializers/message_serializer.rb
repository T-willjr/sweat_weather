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

  def self.hashed_login_error 
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
end 