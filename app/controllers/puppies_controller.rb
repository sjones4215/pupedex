class PuppiesController < ApplicationController
    before_action :set_puppy, only:[:show, :update, :destroy]
    skip_before_action :authenticate, only:[:index, :show]

    def index
        if params[:search]
            @puppies = Puppy.search(params[:search]).order("created_at DESC")
        else
            @puppies = Puppy.all.order('created_at DESC')
        end
        
        if @puppies.size == 0
            render json: "We could not find anything matching this criteria"
        end
            render json: @puppies
    end

    def show
        @reviews = Review.where(puppy_id: params[:id])   
        render json: { puppy: @puppy, reviews: @reviews }                                                                                 
    end

    def create
        @puppy = Puppy.new(puppy_params)
        if @puppy.save
            render json: @puppy, status: :created
        else
            render json: @puppy.errors, status: :unprocessable_entity
        end
    end

    def update
        if @puppy.update(puppy_params)
            render json: @puppy 
        else
            render json: @puppy.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @puppy.destroy
    end

    private

    def set_puppy
        @puppy = Puppy.find(params[:id])
    end

    def puppy_params
        params.require(:puppy).permit(:name, :age, :breed, :size, :search)
    end
end
