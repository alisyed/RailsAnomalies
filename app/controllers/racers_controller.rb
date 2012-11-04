class RacersController < ApplicationController
  def race
    @racer=Racer.first
    @was_in_if_block,@was_outside_if_block=false,false
    respond_to do |format|
      if @racer.name == 'john'
        format.json do 
          render :json => @racer 
          @was_in_if_block=true #test this in specs to show that this block was executed (note return in previous line!)
          return true
        end
        
      end
      @was_outside_if_block=true
      format.json { render :json => @racer.name="foobar" }
      format.html { @racer }
    end
  end
end
