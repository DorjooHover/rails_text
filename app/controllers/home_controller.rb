class HomeController < ApplicationController
  def index
  end

  def about
    @about_me = "Blah2"
    @answer = 2 + 2
  end

end
