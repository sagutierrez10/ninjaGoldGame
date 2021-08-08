class GoldgamesController < ApplicationController
    def index        
        p session[:activities]
        if session[:activities] == nil
            session[:activities] ||= []
        end

        if session[:gold] == nil
            session[:gold] = 0
        end
        render 'index'
    end

    def gold
        if session[:visits] == nil
            session[:visits] = 0
        end
        if session[:gold] == nil
            session[:gold] = 0
        end

        if params[:farm] != nil
            random = rand(10..20)
            str = "Earned  #{random} golds from the farm!"
        elsif params[:cave] != nil
            random = rand(5..10)
            str = "Earned  #{random} golds from the cave!"
        elsif params[:house] != nil
            random = rand(2..5)
            str = "Earned  #{random} golds from the house!"
        elsif params[:casino] != nil
            random = rand(-50..50)
            str = ''
            if
                str = "Lost #{random} golds from the casino"
            else
                str = "Earned #{random} golds from the casino"
            end
        end
        session[:gold] += random
        session[:activities] << str
        
        redirect_to '/'
        # session[:visits]+= 1
        # render :text => "You have visited thir url #{session[:visits]} times"
    end
end

