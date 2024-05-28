class MikusController < ActionController::API
  def index
    render json: { test: 'Hello, World!' }
    # render
  end
end
