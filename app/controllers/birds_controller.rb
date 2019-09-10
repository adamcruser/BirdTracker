class BirdsController < ApplicationController
    def index
        @birds= Bird.all
        render json:@birds
end
    def show
        @bird=Bird.find(params[:id]).to_json(:include=>:sightings)
        render json:@bird
end
    def create
        @bird= Bird.new(bird_params)
        if @bird.save
            render json:@bird, status:201
        else
            render json:@bird.errors, status:422
        end
end

    def update
        @bird = Bird.find(params[:id])
        if @bird.update(bird_params)
            redirect_to @bird
        else
            render 'you have sucessfully updated'
        end
end

    def destroy
        @bird= Bird.find(params[:id])
        if @bird.destroy
            render json:@bird, status:200
        else render json:{ errors:'could not destroy birds'}, status:400
    end
end

    private

        def bird_params
            params.require(:bird).permit(:name, :species, :color,)
        end
end
