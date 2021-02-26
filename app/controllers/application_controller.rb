class ApplicationController < ActionController::Base
  before_action :set_counter

  private

  def set_counter
    @show_count = Show.count
  end 
end
