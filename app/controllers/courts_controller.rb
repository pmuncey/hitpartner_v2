class CourtsController < ApplicationController
  def index
    @q = Court.ransack(params[:q])
    @courts = @q.result(:distinct => true).includes(:matches).page(params[:page]).per(10)

    render("courts/index.html.erb")
  end

  def show
    @match = Match.new
    @court = Court.find(params[:id])

    render("courts/show.html.erb")
  end

  def new
    @court = Court.new

    render("courts/new.html.erb")
  end

  def create
    @court = Court.new

    @court.name = params[:name]
    @court.description = params[:description]
    @court.location = params[:location]
    @court.photo = params[:photo]

    save_status = @court.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/courts/new", "/create_court"
        redirect_to("/courts")
      else
        redirect_back(:fallback_location => "/", :notice => "Court created successfully.")
      end
    else
      render("courts/new.html.erb")
    end
  end

  def edit
    @court = Court.find(params[:id])

    @court.name = params[:name]
    @court.description = params[:description]
    @court.location = params[:location]
    @court.photo = params[:photo]
    
    render("courts/edit.html.erb")
  end

  def update
    @court = Court.find(params[:id])

    @court.name = params[:name]
    @court.description = params[:description]
    @court.location = params[:location]

    save_status = @court.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/courts/#{@court.id}/edit", "/update_court"
        redirect_to("/courts/#{@court.id}", :notice => "Court updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Court updated successfully.")
      end
    else
      render("courts/edit.html.erb")
    end
  end

  def destroy
    @court = Court.find(params[:id])

    @court.destroy

    if URI(request.referer).path == "/courts/#{@court.id}"
      redirect_to("/", :notice => "Court deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Court deleted.")
    end
  end

  def street_to_coords
    @street_address = params[:location]
    @street_address_with_pluses = @street_address.gsub(" ","+")

    # ==========================================================================
    # Your code goes below.
    #
    # The street address that the user typed is in the variable @street_address.
    # ==========================================================================
    url = "http://maps.googleapis.com/maps/api/geocode/json?address=" + @street_address_with_pluses # root url + whatever is after question mark
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)



    @latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

    @longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

    render("geocoding/street_to_coords.html.erb")
  end

end
