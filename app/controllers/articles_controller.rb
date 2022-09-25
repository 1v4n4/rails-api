class ArticlesController < ApplicationController
  def index
    render json: {}, status: :ok #will be ok without status set
  end

  def show
  end
end