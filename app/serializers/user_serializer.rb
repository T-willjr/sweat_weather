class UserSerializer  
  class << self

    def hashed(user)
          {
          "data": {
            "type": "users",
            "id": user.id,
            "attributes": {
              "email": user.email,
              "api_key": user.private_api_key_bidx
              }
            }
          }
    end
  end
end 