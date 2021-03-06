class MatchesController < ApplicationController
  def index
    if current_user.college_tennis == true
      @q = Match.where(:hitpartner_id => current_user.id).ransack(params[:q])
      @matches = @q.result(:distinct => true).includes(:player, :hitpartner, :messages, :court).page(params[:page]).per(10)
    else
    @q = Match.where(:player_id => current_user.id).ransack(params[:q])
    @matches = @q.result(:distinct => true).includes(:player, :hitpartner, :messages, :court).page(params[:page]).per(10)


  end

    render("matches/index.html.erb")
  end

  def show
    @message = Message.new

    @message.body = params[:body]
    @message.match_id = params[:match_id]
    @message.user_id = params[:user_id]

    @match = Match.find(params[:id])

    render("matches/show.html.erb")
  end

  def new
    @match = Match.new



    render("matches/new.html.erb")
  end

  def create
    @match = Match.new

    @match.player_id = params[:player_id]
    @match.hitpartner_id = params[:hitpartner_id]
    @match.court_id = params[:court_id]
    @match.confirmation = params[:confirmation_id]

    save_status = @match.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/matches/new", "/create_match"
        redirect_to("/matches")
      else
        redirect_back(:fallback_location => "/", :notice => "Match created successfully.")
      end
    else
      render("matches/new.html.erb")
    end
  end

  def edit
    @match = Match.find(params[:id])



    render("matches/edit.html.erb")
  end

  def update
    @match = Match.find(params[:id])

    @match.player_id = params[:player_id]
    @match.hitpartner_id = params[:hitpartner_id]
    @match.court_id = params[:court_id]

    save_status = @match.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/matches/#{@match.id}/edit", "/update_match"
        redirect_to("/matches/#{@match.id}", :notice => "Match updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Match updated successfully.")
      end
    else
      render("matches/edit.html.erb")
    end
  end

  def destroy
    @match = Match.find(params[:id])

    @match.destroy

    if URI(request.referer).path == "/matches/#{@match.id}"
      redirect_to("/", :notice => "Match deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Match deleted.")
    end
  end
end
