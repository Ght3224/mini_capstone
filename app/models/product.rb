class Product < ApplicationRecord



  def is_discounted?


    if price.to_i < 10.to_i
       true 
    else 
       false 
    end 



  end 


  def tax

   tax = price.to_f * 0.09

  end 


  def total 

    total = price.to_f + tax.to_f

  end 


end
