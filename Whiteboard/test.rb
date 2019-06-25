def array_other
i, array = 1, []
  while i <= 100 
      if i % 2 != 0
        array << i 
      end  
    i+=1
  end 
 array 
end 

p array_other