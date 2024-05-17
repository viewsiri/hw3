class EntriesController < ApplicationController

  def new
    @place = Place.find_by({ "id" => params["place_id"] })
    # render contacts/new view with new Contact form
  end

  def create
    @entry = Entry.new

    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["posted_on"] = params["posted_on"]

    # assign relationship between Entry and Place
    @entry["place_id"] = params["place_id"]

    # save Entry row
    @entry.save

    # redirect user
    redirect_to "/places/#{@entry["place_id"]}"
  end
  
end
