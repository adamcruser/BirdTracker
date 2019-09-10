class SightingsController < ApplicationController

      def index
        @sightings = Sighting.where(date: params[:date])
        render json: @sightings
      end
  end
        def show
            @sighting=Sighting.find(params[:id])
            render json:@sighting
    end
        def create
            @sighting= Sighting.new(sighting_params)
            if @sighting.save
                render json:@sighting, status:201
            else
                render json:@sighting.errors, status:422
            end
    end

        def update
            @sighting = Sighting.find(params[:id])
            if @sighting.update(sighting_params)
                redirect_to @sighting
            else
                render 'you have failed to update'
            end
    end

        def destroy
            @sighting= Sighting.find(params[:id])
            if @sighting.destroy
                render json:@sighting, status:200
            else render json:{ errors:'could not destroy sightings'}, status:400
        end
    end

        private

            def sighting_params
                params.require(:sighting).permit(:date, :bird_id)
            end
