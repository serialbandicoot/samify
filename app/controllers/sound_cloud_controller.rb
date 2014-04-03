class SoundCloudController < ApplicationController
  def index

    respond_to do |format|
      format.json { render :json => {hello: "sam"} }
      format.html
    end
  end
end
