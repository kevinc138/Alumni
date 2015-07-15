class HomeController < ApplicationController
  def index
  	@alumnus = Alumnu.all
  end
end
