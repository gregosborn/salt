class BatterController < ApplicationController
 def index
    batter = Batter.todaystats(425877)
    batters = batter
  end
  
  def show
      @batter = Batter.todaystats(params[:id])
   end
  end
    
 