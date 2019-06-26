require "http"




response = HTTP.get('http://localhost:3000/api/food_to_come')


response2= HTTP.get('http://localhost:3000/api/food_to_get_at_store')

response3= HTTP.get('http://localhost:3000/api/food_to_send')



products = response.parse 

products2 = response2.parse 


products3 = response3.parse 




p 'Choose between food to come (to your place) (Type F), food to get at local store (Type S), or food to send to others (Type O)' 
answer = gets.chomp 

if answer.upcase == "F"
    products.each{|food| p food}
  elsif answer.upcase == "S"
    products2.each{|food| p food}
  elsif answer.upcase == "O"
    products3.each{|food| p food}
end 


table = TTY::Table.new ['Food','Price'], [[products3, products3["message"]["price"]], ['X', 'X']]

p table 