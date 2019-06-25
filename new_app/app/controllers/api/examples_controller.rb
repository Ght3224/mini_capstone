class Api::ExamplesController < ApplicationController

  def the_function1
    @number = rand(9999)
    render 'function1.jb'
  end 



  def the_function2 
    @number = rand(99)
    render 'function2.jb'
  end 


  def the_function3 
    render 'function3.jb'
  end

end 