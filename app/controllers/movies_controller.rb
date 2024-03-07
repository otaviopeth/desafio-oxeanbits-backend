class MoviesController < ApplicationController
  before_action :authenticate_user!

  def index
    @movies = Movie.all
    render json: @movies.to_json(methods: :average_score)
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      render json: @movie, status: :created
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :director)
  end
end
