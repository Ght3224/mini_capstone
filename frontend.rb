require "http"


response = HTTP.get("http://localhost:3000/api/products")


#body needs to get paramters for POST, UPDATE, )


p response.parse