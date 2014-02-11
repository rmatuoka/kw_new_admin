class Admin::StaticsController < ApplicationController     
  access_control do
      allow :administrator, :all
  end
  def show
  end
end
