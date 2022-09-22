class DemoControllerController < ApplicationController
  def index
    #render('demoView')
    @demos = demo_controller.new
  end

  # def demoView
  #   render('index')
  # end
end
