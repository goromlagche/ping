class PingsController < ApplicationController
  def show
    HelloJob.perform_later
    render json: 'Sent email to mrinmoy.das91@gmail.com'
  end
end
